module Users
  class SignUpTransaction < BaseTransaction
    step :validate
    step :create_user
    step :create_organization
    step :add_user_as_owner_to_organization
    step :create_subscription
    step :send_welcome_mail

    private

    attr_reader :user, :organization

    def validate(input)
      Success(input)
    end

    def create_user(input)
      @user = ::User.create!(
        email: input[:email],
        name: input[:name],
        password: input[:password],
        password_confirmation: input[:password],
      )
      
      Success(input)
    end

    def create_organization(input)
      @organization = ::Organization.create!(name: input[:organization_name])
      
      Success(input)
    end

    def add_user_as_owner_to_organization(input)
      ::OrganizationMembership.create!(user: user, organization: organization, role: "owner")
      
      Success(input)
    end

    def create_subscription(input)
      subscription = ::StripeApi::Subscriptions::CreateService.new(source_token: input[:source_token]).call
      user.update!(subscription_paid_at: Time.current, subscription_uid: subscription.id) if subscription

      Success(input)
    end

    def send_welcome_mail(input)
      UserMailer.sign_up_email(user.id).deliver

      Success(user)
    end
  end
end
