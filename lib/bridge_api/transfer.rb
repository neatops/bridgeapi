# frozen_string_literal: true

module BridgeApi
  #
  # Transfer resource is deprecated, use Payment instead
  #
  class Transfer < Payment
    RESOURCE_TYPE = "transfert"

    class << self
      def send(access_token:, **params)
        warn "BridgeApi::Transfer.send is deprecated. Use BridgeApi::Payment.create_payment_link instead."
        create_payment_link(access_token: access_token, **params)
      end

      def list(access_token:, **params)
        warn "BridgeApi::Transfer.list is deprecated. Use BridgeApi::Payment.list_payment_requests instead."
        list_payment_requests(access_token: access_token, **params)
      end

      def find(uuid:, access_token:, **params)
        warn "BridgeApi::Transfer.find is deprecated. Use BridgeApi::Payment.get_payment_request instead."
        get_payment_request(id: uuid, access_token: access_token, **params)
      end

      def list_all_sender_accounts(access_token:, **params)
        warn "BridgeApi::Transfer.list_all_sender_accounts is deprecated."
        {}
      end

      def list_all_receiver_accounts(access_token:, **params)
        warn "BridgeApi::Transfer.list_all_receiver_accounts is deprecated. Use BridgeApi::Payment.list_beneficiaries instead."
        list_beneficiaries(access_token: access_token, **params)
      end

      def list_receiver_accounts_for_sender(sender_account_id:, access_token:, **params)
        warn "BridgeApi::Transfer.list_receiver_accounts_for_sender is deprecated. Use BridgeApi::Payment.list_beneficiaries instead."
        list_beneficiaries(access_token: access_token, **params)
      end
    end
  end
end
