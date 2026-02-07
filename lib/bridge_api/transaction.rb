# frozen_string_literal: true

module BridgeApi
  #
  # Transaction resource
  #
  class Transaction < BridgeObject
    RESOURCE_TYPE = "transaction"

    class << self
      include API::Resource

      #
      # List all logged in user transactions
      #
      # @param [String] access_token the access token provided during the user authentication
      # @param [Hash] params any params that might be required (or optional) to communicate with the API
      #
      # @return [Array<Transaction>] the user transactions
      #
      def list(access_token:, **params)
        protected_resource(access_token) do
          data = api_client.get("/v3/aggregation/transactions", **params)
          convert_to_bridge_object(**data)
        end
      end

      #
      # Retrieve a single transaction for logged in user
      #
      # @param [Integer] id the id of the requested resource
      # @param [String] access_token the access token provided during the user authentication
      # @param [Hash] params any params that might be required (or optional) to communicate with the API
      #
      # @return [Transaction] the requested transaction
      #
      def find(id:, access_token:, **params)
        protected_resource(access_token) do
          data = api_client.get("/v3/aggregation/transactions/#{id}", **params)
          convert_to_bridge_object(**data)
        end
      end

      #
      # List all logged in user transactions for a specific account
      #
      # @param [Integer] account_id the account id
      # @param [String] access_token the access token provided during the user authentication
      # @param [Hash] params any params that might be required (or optional) to communicate with the API
      #
      # @return [Array<Transaction>] the user transactions for the account
      #
      def list_by_account(account_id:, access_token:, **params)
        protected_resource(access_token) do
          params[:account_ids] = account_id
          data = api_client.get("/v3/aggregation/transactions", **params)
          convert_to_bridge_object(**data)
        end
      end

      # Deprecated methods

      def list_updated(access_token:, **params)
        warn "BridgeApi::Transaction.list_updated is deprecated. Use BridgeApi::Transaction.list with since parameter instead."
        list(access_token: access_token, **params)
      end

      def list_updated_by_account(account_id:, access_token:, **params)
        warn "BridgeApi::Transaction.list_updated_by_account is deprecated. Use BridgeApi::Transaction.list_by_account with since parameter instead."
        list_by_account(account_id: account_id, access_token: access_token, **params)
      end

      def list_by_iban(access_token:, **params)
        warn "BridgeApi::Transaction.list_by_iban is deprecated. Use BridgeApi::Transaction.list with filters instead."
        list(access_token: access_token, **params)
      end
    end
  end
end
