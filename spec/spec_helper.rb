# frozen_string_literal: true

require "securerandom"

require "bridge_api"
require "shared/resource_context"
require "webmock/rspec"
require "vcr"
require "pry"

BridgeApi.configure do |config|
  config.api_client_id = ENV["BRIDGE_API_CLIENT_ID"]
  config.api_client_secret = ENV["BRIDGE_API_CLIENT_SECRET"]
end

VCR.configure do |config|
  config.cassette_library_dir = "spec/vcr"
  config.hook_into :webmock
  config.configure_rspec_metadata!
  config.define_cassette_placeholder("<api_client_id>") { BridgeApi.configuration.api_client_id }
  config.define_cassette_placeholder("<api_client_secret>") { BridgeApi.configuration.api_client_secret }
  # config.debug_logger = $stderr
  
  # Ignore SSL errors for recording in development/test
  config.ignore_localhost = true
end

# Disable SSL verification for tests to avoid SSLError
OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  config.include_context "when resource is public", public_resource: true
  config.include_context "when resource is private", private_resource: true
end
