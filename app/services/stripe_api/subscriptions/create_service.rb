module StripeApi
  module Subscriptions
    class CreateService
      def initialize(source_token:)
        @source_token = source_token
      end

      def call
        if rand(2) == 0
          return false
        else
          OpenStruct.new(id: SecureRandom.hex(12))
        end
      end
    end
  end
end
