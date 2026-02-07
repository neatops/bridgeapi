# frozen_string_literal: true

#
# BridgeApi module
#
module BridgeApi
  def self.configuration
    @configuration ||= Configuration.new
  end

  def self.configuration=(config)
    @configuration = config
  end

  def self.configure
    yield configuration
  end

  #
  # Configurations setup
  #
  class Configuration
    attr_reader :api_base_url, :api_version
    attr_accessor :api_client_id, :api_client_secret, :follow_pages, :debug

    #
    # Initializes Configuration
    #
    def initialize
      @api_base_url = "https://api.bridgeapi.io"
      @api_version = "2025-01-15"
      @api_client_id = ""
      @api_client_secret = ""
      @follow_pages = false
      @debug = false
    end
  end
end
