# frozen_string_literal: true

RSpec.describe BridgeApi::Stock do
  let(:stock_id) { 2_535_999 }

  describe ".list", private_resource: true do
    subject { described_class.list(access_token: access_token) }

    it_behaves_like "a protected resource" do
      let(:request_method) { :get }
      let(:endpoint) { "/v3/aggregation/stocks" }
    end
  end

  describe ".find", private_resource: true do
    subject { described_class.find(id: stock_id, access_token: access_token) }

    it_behaves_like "a protected resource" do
      let(:request_method) { :get }
      let(:endpoint) { "/v3/aggregation/stocks/#{stock_id}" }
    end
  end
end
