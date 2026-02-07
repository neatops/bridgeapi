# frozen_string_literal: true

RSpec.describe BridgeApi::Account do
  describe ".list", private_resource: true do
    subject { described_class.list(access_token: access_token) }

    it_behaves_like "a protected resource" do
      let(:request_method) { :get }
      let(:endpoint) { "/v3/aggregation/accounts" }
    end
  end

  describe ".find", private_resource: true do
    subject { described_class.find(id: account_id, access_token: access_token) }

    it_behaves_like "a protected resource" do
      let(:account_id) { 22_167_853 }
      let(:request_method) { :get }
      let(:endpoint) { "/v3/aggregation/accounts/#{account_id}" }
    end
  end
end
