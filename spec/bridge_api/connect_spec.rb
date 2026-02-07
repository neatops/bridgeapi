# frozen_string_literal: true

RSpec.describe BridgeApi::Connect do
  let(:iban) { { iban: "FR7330003000305156978968I67" } }

  describe ".connect_item", :private_resource do
    subject { described_class.connect_item(access_token: access_token) }

    it_behaves_like "a protected resource" do
      let(:request_method) { :post }
      let(:endpoint) { "/v3/aggregation/connect-sessions" }
    end
  end

  describe ".connect_item_with_iban", :private_resource do
    subject { described_class.connect_item_with_iban(access_token: access_token) }

    it_behaves_like "a protected resource" do
      let(:request_method) { :post }
      let(:endpoint) { "/v3/aggregation/connect-sessions" }
    end
  end

  describe ".edit_item", :private_resource do
    subject { described_class.edit_item(access_token: access_token) }

    it_behaves_like "a protected resource" do
      let(:request_method) { :post }
      let(:endpoint) { "/v3/aggregation/connect-sessions" }
    end
  end

  describe ".item_sync", :private_resource do
    subject { described_class.item_sync(access_token: access_token) }

    it_behaves_like "a protected resource" do
      let(:request_method) { :post }
      let(:endpoint) { "/v3/aggregation/connect-sessions" }
    end
  end

  describe ".validate_email", :private_resource do
    subject { described_class.validate_email(access_token: access_token) }

    it_behaves_like "a protected resource" do
      let(:request_method) { :post }
      let(:endpoint) { "/v3/aggregation/connect-sessions" }
    end
  end

  describe ".validate_pro_items", :private_resource do
    subject { described_class.validate_pro_items(access_token: access_token) }

    it_behaves_like "a protected resource" do
      let(:request_method) { :post }
      let(:endpoint) { "/v3/aggregation/connect-sessions" }
    end
  end
end
