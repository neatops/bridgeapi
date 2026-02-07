# frozen_string_literal: true

module BridgeApi
  #
  # User resource
  #
  class User < BridgeObject
    RESOURCE_TYPE = "user"

    class << self
      include API::Resource

      #
      # List all registered users
      #
      # @param [Hash] params any params that might be required (or optional) to communicate with the API
      #
      # @return [Array<User>] the registered users list
      #
      def list(**params)
        data = api_client.get("/v3/aggregation/users", **params)
        convert_to_bridge_object(**data)
      end

      #
      # Retrieve a specific user
      #
      # @param [UUID] uuid the uuid of the requested resource
      # @param [Hash] params any params that might be required (or optional) to communicate with the API
      #
      # @return [User] the requested user
      #
      def find(uuid:, **params)
        data = api_client.get("/v3/aggregation/users/#{uuid}", **params)
        convert_to_bridge_object(**data)
      end

      #
      # Create a new user
      #
      # @param [Hash] params any params that might be required (or optional) to communicate with the API
      #
      # @return [User] the newly created user
      #
      def create(**params)
        data = api_client.post("/v3/aggregation/users", **params)
        convert_to_bridge_object(**data)
      end

      #
      # Delete a specific user
      #
      # @param [UUID] uuid the uuid of the requested resource
      # @param [Hash] params any params that might be required (or optional) to communicate with the API
      #
      # @return [Boolean] the request success status
      #
      def delete_user(uuid:, **params)
        api_client.delete("/v3/aggregation/users/#{uuid}", **params)
        true
      end

      #
      # Delete all registered users
      #
      # @param [Hash] params any params that might be required (or optional) to communicate with the API
      #
      # @return [Boolean] the request success status
      #
      def delete_all_users(**params)
        api_client.delete("/v3/aggregation/users", **params)
        true
      end

      # Deprecated methods

      def update_email(uuid:, **params)
        warn "BridgeApi::User.update_email is deprecated and no longer available in v3 API."
        {}
      end

      def update_password(uuid:, **params)
        warn "BridgeApi::User.update_password is deprecated and no longer available in v3 API."
        {}
      end

      def check_email_confirmation(access_token:, **params)
        warn "BridgeApi::User.check_email_confirmation is deprecated and no longer available in v3 API."
        {}
      end

      def manage_accounts(access_token:, **params)
        warn "BridgeApi::User.manage_accounts is deprecated and no longer available in v3 API."
        {}
      end
    end
  end
end
