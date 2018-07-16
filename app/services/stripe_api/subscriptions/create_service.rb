module StripeApi
  module Subscriptions
    class CreateService
      def initialize(source_token:)
        @source_token = source_token
      end

      def call
        if rand(3) == 0
          raise "Payment failed"
        else
          OpenStruct.new(id: SecureRandom.hex(12))
        end
      end
    end
  end
end
