# frozen_string_literal: true

require "net/http"
require "uri"
require "json"

require "bridge_api/api/error"

module BridgeApi
  module API
    #
    # Allows to request the Bridge API using Ruby native net/http library
    #
    class Client
      HTTP_VERBS_MAP = {
        get: Net::HTTP::Get,
        post: Net::HTTP::Post,
        put: Net::HTTP::Put,
        delete: Net::HTTP::Delete
      }.freeze

      attr_accessor :access_token

      #
      # Handles a GET request
      #
      # @param [String] path the API endpoint PATH to query
      # @param [Hash] params any params that might be required (or optional) to communicate with the API
      #
      # @return [Hash] the parsed API response
      #
      # @raise [API::Error] expectation if API responding with any error
      #
      def get(path, **params)
        request :get, path, params
      end

      #
      # Handles a POST request
      #
      # @param (see #get)
      #
      # @return (see #get)
      #
      # @raise (see #get)
      #

      def post(path, **params)
        request :post, path, params
      end

      #
      # Handles a PUT request
      #
      # @param (see #get)
      #
      # @return (see #get)
      #
      # @raise (see #get)
      #
      def put(path, **params)
        request :put, path, params
      end

      #
      # Handles a DELETE request
      #
      # @param (see #get)
      #
      # @return (see #get)
      #
      # @raise (see #get)
      #
      def delete(path, **params)
        request :delete, path, params
      end

      private

      def request(method, path, params = {})
        make_http_request do
          if !method.in?(%i(get delete))
            HTTP_VERBS_MAP[method].new(path, headers).tap do |request|
              request.body = params.to_json 
            end
          else
            HTTP_VERBS_MAP[method].new(encode_path(path, params), headers)
          end
        end
      end

      def make_http_request
        Net::HTTP.start(uri.host, uri.port, use_ssl: true) do |http|
          http.set_debug_output($stdout) if debug?

          request = yield

          if debug?
            puts "\n--- BRIDGE API REQUEST ---"
            puts "#{request.method} #{uri}#{request.path}"
            request.each_header { |k, v| puts "  #{k}: #{v}" }
            puts "  Body: #{request.body.inspect}" if request.body
            puts "--------------------------\n"
          end

          api_response = http.request(request)

          if debug?
            puts "--- BRIDGE API RESPONSE #{api_response.code} ---"
            puts api_response.body
            puts "-------------------------------\n"
          end

          case api_response.code
          when "200", "201"
            data = parse_response_body(api_response.body)

            if data.dig(:pagination, :next_uri) && follow_pages
              handle_paging(data)
            else
              data
            end
          when "204", "202"
            {}
          else
            handle_error(api_response)
          end
        end
      end

      def parse_response_body(json_response_body)
        JSON.parse(json_response_body, symbolize_names: true)
      end

      def uri
        @uri ||= URI.parse(BridgeApi.configuration.api_base_url)
      end

      def follow_pages
        BridgeApi.configuration.follow_pages
      end

      def debug?
        BridgeApi.configuration.debug
      end

      def handle_paging(data)
        page_uri = URI.parse(data[:pagination][:next_uri])
        params = URI.decode_www_form(page_uri.query).to_h

        next_page_data = get(page_uri.path, **params)

        next_page_data[:resources] = data[:resources] + next_page_data[:resources]
        next_page_data
      end

      def headers
        headers =
          {
            "Bridge-Version" => BridgeApi.configuration.api_version,
            "Client-Id" => BridgeApi.configuration.api_client_id,
            "Client-Secret" => BridgeApi.configuration.api_client_secret,
            "Content-Type" => "application/json",
            "Accept" => "application/json"
          }

        return headers unless access_token

        headers.merge!("Authorization" => "Bearer #{access_token}")
      end

      def encode_path(path, params = nil)
        URI::HTTP
          .build(path: path, query: URI.encode_www_form(params))
          .request_uri
      end

      def handle_error(api_response)
        response_body = parse_response_body(api_response.body)

        case api_response.code
        when "400"
          raise API::BadRequestError.new(api_response.code, response_body)
        when "401"
          raise API::UnauthorizedError.new(api_response.code, response_body)
        when "403"
          raise API::ForbiddenError.new(api_response.code, response_body)
        when "404"
          raise API::NotFoundError.new(api_response.code, response_body)
        when "409"
          raise API::ConflictError.new(api_response.code, response_body)
        when "415"
          raise API::UnsupportedMediaTypeError.new(api_response.code, response_body)
        when "422"
          raise API::UnprocessableEntityError.new(api_response.code, response_body)
        when "429"
          raise API::TooManyRequestsError.new(api_response.code, response_body)
        when "500"
          raise API::InternalServerError.new(api_response.code, response_body)
        else
          raise API::Error.new(api_response.code, response_body)
        end
      end
    end
  end
end
