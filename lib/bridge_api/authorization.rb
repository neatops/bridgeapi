# frozen_string_literal: true

require "time"

module BridgeApi
  #
  # User authentication & authorization
  #
  class Authorization
    attr_reader :access_token, :expires_at

    #
    # Initializes Authorization
    #
    # @param [String] access_token access token the access token provided by the API
    # @param [Time] expires_at the expiration time for the provided access token
    #
    def initialize(access_token, expires_at)
      @access_token = access_token
      @expires_at = Time.parse(expires_at)
    end

    class << self
      include API::Resource

      #
      # Generate an access token for a Bridge user
      #
      # @param [String] user_uuid the Bridge user UUID
      # @param [String] external_user_id the external user identifier (alternative to user_uuid)
      #
      # @return [Authorization] the authorization informations provided by the API
      #
      def generate_token(user_uuid: nil, external_user_id: nil)
        params = {}
        params[:user_uuid] = user_uuid if user_uuid
        params[:external_user_id] = external_user_id if external_user_id

        response = api_client.post("/v3/aggregation/authorization/token", **params)
        new(response[:access_token], response[:expires_at])
      end
    end
  end
end
