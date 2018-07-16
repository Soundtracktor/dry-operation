module Subscriptions
  class CreateOperation < BaseOperation
    def call(user_id, input)
      begin
        user = User.find(user_id)
        subscription = ::StripeApi::Subscriptions::CreateService.new(source_token: input[:source_token]).call
        user.update!(subscription_paid_at: Time.current, subscription_uid: subscription.id)
        Success(subscription: subscription, user: user.reload)
      rescue StandardError => e
        Failure(e.message)
      end
    end
  end
end
