# frozen_string_literal: true

module BridgeApi
  #
  # Connect resource
  #
  class Connect < BridgeObject
    class << self
      include API::Resource

      #
      # Create a Connect session (replaces all old connect methods)
      #
      # @param [String] access_token the access token provided during the user authentication
      # @param [Hash] params any params that might be required (or optional) to communicate with the API
      #
      # @return [BridgeObject] Connect session with redirect_url
      #
      def create_session(access_token:, **params)
        protected_resource(access_token) do
          data = api_client.post("/v3/aggregation/connect-sessions", **params)
          convert_to_bridge_object(**data)
        end
      end

      # Deprecated methods - kept for backward compatibility
      
      def connect_item(access_token:, **params)
        warn "BridgeApi::Connect.connect_item is deprecated. Use BridgeApi::Connect.create_session instead."
        create_session(access_token: access_token, **params)
      end

      def connect_item_with_iban(access_token:, **params)
        warn "BridgeApi::Connect.connect_item_with_iban is deprecated. Use BridgeApi::Connect.create_session instead."
        create_session(access_token: access_token, **params)
      end

      def edit_item(access_token:, **params)
        warn "BridgeApi::Connect.edit_item is deprecated. Use BridgeApi::Connect.create_session instead."
        create_session(access_token: access_token, **params)
      end

      def item_sync(access_token:, **params)
        warn "BridgeApi::Connect.item_sync is deprecated. Use BridgeApi::Connect.create_session instead."
        create_session(access_token: access_token, **params)
      end

      def validate_email(access_token:, **params)
        warn "BridgeApi::Connect.validate_email is deprecated. Use BridgeApi::Connect.create_session instead."
        create_session(access_token: access_token, **params)
      end

      def validate_pro_items(access_token:, **params)
        warn "BridgeApi::Connect.validate_pro_items is deprecated. Use BridgeApi::Connect.create_session instead."
        create_session(access_token: access_token, **params)
      end
    end
  end
end
