# frozen_string_literal: true

module BridgeApi
  module API
    #
    # Extend any resource class with API specific methods
    #
    module Resource
      private

      def protected_resource(access_token)
        client = API::Client.new
        client.access_token = access_token
        Thread.current[:bridge_api_api_client] = client
        yield
      ensure
        Thread.current[:bridge_api_api_client] = nil
      end

      def api_client
        Thread.current[:bridge_api_api_client] || API::Client.new
      end
    end
  end
end
