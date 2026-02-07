# frozen_string_literal: true

RSpec.describe BridgeApi::User do
  let(:user_uuid) { "73a9a664-66b9-41a3-8f93-e404036f7c2e" }

  describe ".list", :public_resource do
    subject { described_class.list }

    it_behaves_like "a public resource" do
      let(:request_method) { :get }
      let(:endpoint) { "/v3/aggregation/users" }
    end
  end

  describe ".find", :public_resource do
    subject { described_class.find(uuid: user_uuid) }

    it_behaves_like "a public resource" do
      let(:request_method) { :get }
      let(:endpoint) { "/v3/aggregation/users/#{user_uuid}" }
    end
  end

  describe ".create", :public_resource do
    subject { described_class.create(**params) }

    it_behaves_like "a public resource" do
      let(:request_method) { :post }
      let(:endpoint) { "/v3/aggregation/users" }
      let(:params) { { email: "john.doe+2@email.com", password: "password1234" } }
    end
  end

  describe ".update_email", :public_resource do
    subject { described_class.update_email(uuid: user_uuid) }

    it "returns empty hash" do
      expect(subject).to eq({})
    end
  end

  describe ".update_password", :public_resource do
    subject { described_class.update_password(uuid: user_uuid) }

    it "returns empty hash" do
      expect(subject).to eq({})
    end
  end

  describe ".delete_user", :public_resource do
    subject { described_class.delete_user(uuid: user_uuid) }

    it_behaves_like "a public resource" do
      let(:request_method) { :delete }
      let(:endpoint) { "/v3/aggregation/users/#{user_uuid}" }
    end
  end

  describe ".delete_all_users", :public_resource do
    subject { described_class.delete_all_users }

    it_behaves_like "a public resource" do
      let(:request_method) { :delete }
      let(:endpoint) { "/v3/aggregation/users" }
    end
  end

  describe ".check_email_confirmation", :private_resource do
    subject { described_class.check_email_confirmation(access_token: access_token) }

    it "returns empty hash" do
      expect(subject).to eq({})
    end
  end

  describe ".manage_accounts", :private_resource do
    subject { described_class.manage_accounts(access_token: access_token) }

    it "returns empty hash" do
      expect(subject).to eq({})
    end
  end
end
