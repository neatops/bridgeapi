# frozen_string_literal: true

RSpec.describe BridgeApi::Provider do
  describe ".list", public_resource: true do
    subject { described_class.list }

    it_behaves_like "a public resource" do
      let(:request_method) { :get }
      let(:endpoint) { "/v3/providers" }
    end
  end

  describe ".find", public_resource: true do
    subject { described_class.find(id: provider_id) }

    it_behaves_like "a public resource" do
      let(:provider_id) { 457 }
      let(:request_method) { :get }
      let(:endpoint) { "/v3/providers/#{provider_id}" }
    end
  end
end

