# frozen_string_literal: true

RSpec.describe BridgeApi::Item do
  let(:item_id) { 4_388_758 }

  describe ".list", private_resource: true do
    subject { described_class.list(access_token: access_token) }

    it_behaves_like "a protected resource" do
      let(:request_method) { :get }
      let(:endpoint) { "/v3/aggregation/items" }
    end
  end

  describe ".find", private_resource: true do
    subject { described_class.find(id: item_id, access_token: access_token) }

    it_behaves_like "a protected resource" do
      let(:request_method) { :get }
      let(:endpoint) { "/v3/aggregation/items/#{item_id}" }
    end
  end

  describe ".delete", private_resource: true do
    subject { described_class.delete(id: item_id, access_token: access_token) }

    it_behaves_like "a protected resource" do
      let(:request_method) { :delete }
      let(:endpoint) { "/v3/aggregation/items/#{item_id}" }
    end
  end
end
