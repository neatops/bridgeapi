# frozen_string_literal: true

RSpec.describe BridgeApi::Transaction do
  let(:transaction_id) { 38_000_209_858_994 }
  let(:account_id) { 22_167_851 }

  describe ".list", :private_resource do
    subject { described_class.list(access_token: access_token) }

    it_behaves_like "a protected resource" do
      let(:request_method) { :get }
      let(:endpoint) { "/v3/aggregation/transactions" }
    end
  end

  describe ".list_updated", :private_resource do
    subject { described_class.list_updated(access_token: access_token) }

    it_behaves_like "a protected resource" do
      let(:request_method) { :get }
      let(:endpoint) { "/v3/aggregation/transactions" }
    end
  end

  describe ".find", :private_resource do
    subject { described_class.find(id: transaction_id, access_token: access_token) }

    it_behaves_like "a protected resource" do
      let(:request_method) { :get }
      let(:endpoint) { "/v3/aggregation/transactions/#{transaction_id}" }
    end
  end

  describe ".list_by_account", :private_resource do
    subject { described_class.list_by_account(account_id: account_id, access_token: access_token) }

    it_behaves_like "a protected resource" do
      let(:request_method) { :get }
      let(:endpoint) { "/v3/aggregation/transactions" }
      let(:params) { { account_ids: account_id } }
    end
  end

  describe ".list_updated_by_account", :private_resource do
    subject { described_class.list_updated_by_account(account_id: account_id, access_token: access_token) }

    it_behaves_like "a protected resource" do
      let(:request_method) { :get }
      let(:endpoint) { "/v3/aggregation/transactions" }
      let(:params) { { account_ids: account_id } }
    end
  end

  describe ".list_by_iban", :private_resource do
    subject { described_class.list_by_iban(access_token: access_token) }

    it_behaves_like "a protected resource" do
      let(:request_method) { :get }
      let(:endpoint) { "/v3/aggregation/transactions" }
    end
  end
end
