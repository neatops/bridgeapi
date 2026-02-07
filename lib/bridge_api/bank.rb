# frozen_string_literal: true

module BridgeApi
  #
  # Bank resource is deprecated, using Provider instead
  #
  class Bank < Provider
    def self.list(**params)
      warn "BridgeApi::Bank is deprecated. Use BridgeApi::Provider instead."
      super
    end

    def self.find(id:, **params)
      warn "BridgeApi::Bank is deprecated. Use BridgeApi::Provider instead."
      super
    end
  end
end
