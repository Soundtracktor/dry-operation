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
      schema = Users::SignUpTransactionSchema.call(input)
      schema.success? ? Success(schema) : Failure(schema.errors)
    end

    def create_user(input)
      @user = Users::CreateOperation.new.call(input).value!
      
      Success(input)
    end

    def create_organization(input)
      @organization = Organizations::CreateOperation.new.call(
        name: input[:organization_name]
      ).value!
      
      Success(input)
    end

    def add_user_as_owner_to_organization(input)
      OrganizationMemberships::CreateOperation.new.call(
        user: user,
        organization: organization,
        role: 'owner'
      ).value!
      
      Success(input)
    end

    def create_subscription(input)
      Subscriptions::CreateOperation.new(user.id).call(input)

      Success(input)
    end

    def send_welcome_mail(input)
      UserMailer.sign_up_email(user.id).deliver

      Success(user.reload)
    end
  end
end
