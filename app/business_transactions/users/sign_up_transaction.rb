module Users
  class SignUpTransaction < BaseTransaction
    step :validate
    step :create_user, with: "operations.users.create"
    step :create_organization, with: "operations.organizations.create"
    step :add_user_as_owner_to_organization, with: "operations.organization_memberships.create"
    step :create_subscription, with: "operations.subscriptions.create"
    step :send_welcome_mail

    private

    attr_reader :user, :organization

    def validate(input)
      schema = Users::SignUpTransactionSchema.call(input)
      schema.success? ? Success(schema) : Failure(schema.errors)
    end

    def create_user(input)
      operation = super(input)

      return operation if operation.failure?
      
      @user = operation.value!
      
      Success(input)
    end

    def create_organization(input)
      operation = super(name: input[:organization_name])

      return operation if operation.failure?
      
      @organization = operation.value!
      
      Success(input)
    end

    def add_user_as_owner_to_organization(input)
      super(
        user: user,
        organization: organization,
        role: 'owner'
      )
    end

    def create_subscription(input)
      super(user.id, input)
    end

    def send_welcome_mail(input)
      UserMailer.sign_up_email(user.id).deliver

      Success(user.reload)
    end
  end
end
