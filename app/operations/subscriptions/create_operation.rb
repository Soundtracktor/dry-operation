module Subscriptions
  class CreateOperation < BaseOperation
    def initialize(user_id)
      @user = User.find(user_id)
    end

    def call(input)
      subscription = ::StripeApi::Subscriptions::CreateService.new(source_token: input[:source_token]).call
      user.update!(subscription_paid_at: Time.current, subscription_uid: subscription.id)
      
      Success(subscription: subscription, user: user.reload)
    end

    private

    attr_reader :user
  end
end
