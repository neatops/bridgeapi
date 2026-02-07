# frozen_string_literal: true

module BridgeApi
  #
  # Payment resource
  #
  class Payment < BridgeObject
    RESOURCE_TYPE = "payment"

    class << self
      include API::Resource

      #
      # Payment Links
      #

      #
      # Create a new payment link
      #
      # @param [String] access_token the access token provided during the user authentication
      # @param [Hash] params any params that might be required (or optional) to communicate with the API
      #
      # @return [BridgeObject] the created payment link
      #
      def create_payment_link(access_token:, **params)
        protected_resource(access_token) do
          data = api_client.post("/v3/payment/payment-links", **params)
          convert_to_bridge_object(**data)
        end
      end

      #
      # List all payment links
      #
      # @param [String] access_token the access token provided during the user authentication
      # @param [Hash] params any params that might be required (or optional) to communicate with the API
      #
      # @return [Array<BridgeObject>] the list of payment links
      #
      def list_payment_links(access_token:, **params)
        protected_resource(access_token) do
          data = api_client.get("/v3/payment/payment-links", **params)
          convert_to_bridge_object(**data)
        end
      end

      #
      # Get a single payment link
      #
      # @param [String] id the id of the payment link
      # @param [String] access_token the access token provided during the user authentication
      # @param [Hash] params any params that might be required (or optional) to communicate with the API
      #
      # @return [BridgeObject] the requested payment link
      #
      def get_payment_link(id:, access_token:, **params)
        protected_resource(access_token) do
          data = api_client.get("/v3/payment/payment-links/#{id}", **params)
          convert_to_bridge_object(**data)
        end
      end

      #
      # Revoke a payment link
      #
      # @param [String] id the id of the payment link
      # @param [String] access_token the access token provided during the user authentication
      # @param [Hash] params any params that might be required (or optional) to communicate with the API
      #
      # @return [BridgeObject] the revoked payment link
      #
      def revoke_payment_link(id:, access_token:, **params)
        protected_resource(access_token) do
          data = api_client.post("/v3/payment/payment-links/#{id}/revoke", **params)
          convert_to_bridge_object(**data)
        end
      end

      #
      # Payment Requests
      #

      #
      # Create a new payment request
      #
      # @param [String] access_token the access token provided during the user authentication
      # @param [Hash] params any params that might be required (or optional) to communicate with the API
      #
      # @return [BridgeObject] the created payment request
      #
      def create_payment_request(access_token:, **params)
        protected_resource(access_token) do
          data = api_client.post("/v3/payment/payment-requests", **params)
          convert_to_bridge_object(**data)
        end
      end

      #
      # List all payment requests
      #
      # @param [String] access_token the access token provided during the user authentication
      # @param [Hash] params any params that might be required (or optional) to communicate with the API
      #
      # @return [Array<BridgeObject>] the list of payment requests
      #
      def list_payment_requests(access_token:, **params)
        protected_resource(access_token) do
          data = api_client.get("/v3/payment/payment-requests", **params)
          convert_to_bridge_object(**data)
        end
      end

      #
      # Get a single payment request
      #
      # @param [String] id the id of the payment request
      # @param [String] access_token the access token provided during the user authentication
      # @param [Hash] params any params that might be required (or optional) to communicate with the API
      #
      # @return [BridgeObject] the requested payment request
      #
      def get_payment_request(id:, access_token:, **params)
        protected_resource(access_token) do
          data = api_client.get("/v3/payment/payment-requests/#{id}", **params)
          convert_to_bridge_object(**data)
        end
      end

      #
      # Payment Consents
      #

      #
      # Create a payment consent
      #
      # @param [String] access_token the access token provided during the user authentication
      # @param [Hash] params any params that might be required (or optional) to communicate with the API
      #
      # @return [BridgeObject] the created payment consent
      #
      def create_payment_consent(access_token:, **params)
        protected_resource(access_token) do
          data = api_client.post("/v3/payment/consents", **params)
          convert_to_bridge_object(**data)
        end
      end

      #
      # Payment Account
      #

      #
      # Create a refund
      #
      # @param [String] access_token the access token provided during the user authentication
      # @param [Hash] params any params that might be required (or optional) to communicate with the API
      #
      # @return [BridgeObject] the created refund
      #
      def create_refund(access_token:, **params)
        protected_resource(access_token) do
          data = api_client.post("/v3/payment/refunds", **params)
          convert_to_bridge_object(**data)
        end
      end

      #
      # List refunds
      #
      # @param [String] access_token the access token provided during the user authentication
      # @param [Hash] params any params that might be required (or optional) to communicate with the API
      #
      # @return [Array<BridgeObject>] the list of refunds
      #
      def list_refunds(access_token:, **params)
        protected_resource(access_token) do
          data = api_client.get("/v3/payment/refunds", **params)
          convert_to_bridge_object(**data)
        end
      end

      #
      # Get a single refund
      #
      # @param [String] id the id of the refund
      # @param [String] access_token the access token provided during the user authentication
      # @param [Hash] params any params that might be required (or optional) to communicate with the API
      #
      # @return [BridgeObject] the requested refund
      #
      def get_refund(id:, access_token:, **params)
        protected_resource(access_token) do
          data = api_client.get("/v3/payment/refunds/#{id}", **params)
          convert_to_bridge_object(**data)
        end
      end

      #
      # List beneficiaries
      #
      # @param [String] access_token the access token provided during the user authentication
      # @param [Hash] params any params that might be required (or optional) to communicate with the API
      #
      # @return [Array<BridgeObject>] the list of beneficiaries
      #
      def list_beneficiaries(access_token:, **params)
        protected_resource(access_token) do
          data = api_client.get("/v3/payment/beneficiaries", **params)
          convert_to_bridge_object(**data)
        end
      end

      #
      # Create a payout
      #
      # @param [String] access_token the access token provided during the user authentication
      # @param [Hash] params any params that might be required (or optional) to communicate with the API
      #
      # @return [BridgeObject] the created payout
      #
      def create_payout(access_token:, **params)
        protected_resource(access_token) do
          data = api_client.post("/v3/payment/payouts", **params)
          convert_to_bridge_object(**data)
        end
      end

      #
      # List payouts
      #
      # @param [String] access_token the access token provided during the user authentication
      # @param [Hash] params any params that might be required (or optional) to communicate with the API
      #
      # @return [Array<BridgeObject>] the list of payouts
      #
      def list_payouts(access_token:, **params)
        protected_resource(access_token) do
          data = api_client.get("/v3/payment/payouts", **params)
          convert_to_bridge_object(**data)
        end
      end

      #
      # Get a single payout
      #
      # @param [String] id the id of the payout
      # @param [String] access_token the access token provided during the user authentication
      # @param [Hash] params any params that might be required (or optional) to communicate with the API
      #
      # @return [BridgeObject] the requested payout
      #
      def get_payout(id:, access_token:, **params)
        protected_resource(access_token) do
          data = api_client.get("/v3/payment/payouts/#{id}", **params)
          convert_to_bridge_object(**data)
        end
      end
    end
  end
end
