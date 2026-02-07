# frozen_string_literal: true

module BridgeApi
  #
  # Provider resource (formerly Bank)
  #
  class Provider < BridgeObject
    RESOURCE_TYPE = "provider"

    class << self
      include API::Resource

      #
      # List all providers supported by the Bridge API
      #
      # @param [Hash] params any params that might be required (or optional) to communicate with the API
      #
      # @return [Array<Provider>] the supported providers list
      #
      def list(**params)
        data = api_client.get("/v3/providers", **params)
        convert_to_bridge_object(**data)
      end

      #
      # Retrieve a single provider
      #
      # @param [Integer] id the id of the requested resource
      # @param [Hash] params any params that might be required (or optional) to communicate with the API
      #
      # @return [Provider] the requested provider
      #
      def find(id:, **params)
        data = api_client.get("/v3/providers/#{id}", **params)
        convert_to_bridge_object(**data)
      end
    end
  end
end

