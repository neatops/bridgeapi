# frozen_string_literal: true

RSpec.describe BridgeApi::Transfer do
  let(:transfer_uuid) { SecureRandom.uuid }
  let(:sender_account_id) { 123 }

  describe ".send", :private_resource do
    subject { described_class.send(access_token: access_token) }

    it_behaves_like "a protected resource" do
      let(:request_method) { :post }
      let(:endpoint) { "/v3/payment/payment-links" }
    end
  end

  describe ".list", :private_resource do
    subject { described_class.list(access_token: access_token) }

    it_behaves_like "a protected resource" do
      let(:request_method) { :get }
      let(:endpoint) { "/v3/payment/payment-requests" }
    end
  end

  describe ".find", :private_resource do
    subject { described_class.find(uuid: transfer_uuid, access_token: access_token) }

    it_behaves_like "a protected resource" do
      let(:request_method) { :get }
      let(:endpoint) { "/v3/payment/payment-requests/#{transfer_uuid}" }
    end
  end

  describe ".list_all_sender_accounts", :private_resource do
    subject { described_class.list_all_sender_accounts(access_token: access_token) }

    it "returns empty hash" do
      expect(subject).to eq({})
    end
  end

  describe ".list_all_receiver_accounts", :private_resource do
    subject { described_class.list_all_receiver_accounts(access_token: access_token) }

    it_behaves_like "a protected resource" do
      let(:request_method) { :get }
      let(:endpoint) { "/v3/payment/beneficiaries" }
    end
  end

  describe ".list_receiver_accounts_for_sender", :private_resource do
    subject do
      described_class
        .list_receiver_accounts_for_sender(sender_account_id: sender_account_id, access_token: access_token)
    end

    it_behaves_like "a protected resource" do
      let(:request_method) { :get }
      let(:endpoint) { "/v3/payment/beneficiaries" }
    end
  end
end
