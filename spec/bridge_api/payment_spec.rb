# frozen_string_literal: true

RSpec.describe BridgeApi::Payment do
  let(:payment_link_id) { "link_123" }
  let(:payment_request_id) { "req_123" }
  let(:refund_id) { "ref_123" }
  let(:payout_id) { "pay_123" }

  describe ".create_payment_link", private_resource: true do
    subject { described_class.create_payment_link(access_token: access_token) }

    it_behaves_like "a protected resource" do
      let(:request_method) { :post }
      let(:endpoint) { "/v3/payment/payment-links" }
    end
  end

  describe ".list_payment_links", private_resource: true do
    subject { described_class.list_payment_links(access_token: access_token) }

    it_behaves_like "a protected resource" do
      let(:request_method) { :get }
      let(:endpoint) { "/v3/payment/payment-links" }
    end
  end

  describe ".get_payment_link", private_resource: true do
    subject { described_class.get_payment_link(id: payment_link_id, access_token: access_token) }

    it_behaves_like "a protected resource" do
      let(:request_method) { :get }
      let(:endpoint) { "/v3/payment/payment-links/#{payment_link_id}" }
    end
  end

  describe ".revoke_payment_link", private_resource: true do
    subject { described_class.revoke_payment_link(id: payment_link_id, access_token: access_token) }

    it_behaves_like "a protected resource" do
      let(:request_method) { :post }
      let(:endpoint) { "/v3/payment/payment-links/#{payment_link_id}/revoke" }
    end
  end

  describe ".create_payment_request", private_resource: true do
    subject { described_class.create_payment_request(access_token: access_token) }

    it_behaves_like "a protected resource" do
      let(:request_method) { :post }
      let(:endpoint) { "/v3/payment/payment-requests" }
    end
  end

  describe ".list_payment_requests", private_resource: true do
    subject { described_class.list_payment_requests(access_token: access_token) }

    it_behaves_like "a protected resource" do
      let(:request_method) { :get }
      let(:endpoint) { "/v3/payment/payment-requests" }
    end
  end

  describe ".get_payment_request", private_resource: true do
    subject { described_class.get_payment_request(id: payment_request_id, access_token: access_token) }

    it_behaves_like "a protected resource" do
      let(:request_method) { :get }
      let(:endpoint) { "/v3/payment/payment-requests/#{payment_request_id}" }
    end
  end

  describe ".create_payment_consent", private_resource: true do
    subject { described_class.create_payment_consent(access_token: access_token) }

    it_behaves_like "a protected resource" do
      let(:request_method) { :post }
      let(:endpoint) { "/v3/payment/consents" }
    end
  end

  describe ".create_refund", private_resource: true do
    subject { described_class.create_refund(access_token: access_token) }

    it_behaves_like "a protected resource" do
      let(:request_method) { :post }
      let(:endpoint) { "/v3/payment/refunds" }
    end
  end

  describe ".list_refunds", private_resource: true do
    subject { described_class.list_refunds(access_token: access_token) }

    it_behaves_like "a protected resource" do
      let(:request_method) { :get }
      let(:endpoint) { "/v3/payment/refunds" }
    end
  end

  describe ".get_refund", private_resource: true do
    subject { described_class.get_refund(id: refund_id, access_token: access_token) }

    it_behaves_like "a protected resource" do
      let(:request_method) { :get }
      let(:endpoint) { "/v3/payment/refunds/#{refund_id}" }
    end
  end

  describe ".list_beneficiaries", private_resource: true do
    subject { described_class.list_beneficiaries(access_token: access_token) }

    it_behaves_like "a protected resource" do
      let(:request_method) { :get }
      let(:endpoint) { "/v3/payment/beneficiaries" }
    end
  end

  describe ".create_payout", private_resource: true do
    subject { described_class.create_payout(access_token: access_token) }

    it_behaves_like "a protected resource" do
      let(:request_method) { :post }
      let(:endpoint) { "/v3/payment/payouts" }
    end
  end

  describe ".list_payouts", private_resource: true do
    subject { described_class.list_payouts(access_token: access_token) }

    it_behaves_like "a protected resource" do
      let(:request_method) { :get }
      let(:endpoint) { "/v3/payment/payouts" }
    end
  end

  describe ".get_payout", private_resource: true do
    subject { described_class.get_payout(id: payout_id, access_token: access_token) }

    it_behaves_like "a protected resource" do
      let(:request_method) { :get }
      let(:endpoint) { "/v3/payment/payouts/#{payout_id}" }
    end
  end
end

