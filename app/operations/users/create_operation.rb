module Users
  class CreateOperation < BaseOperation
    def initialize

    end

    def call(input)
      Success(
        ::User.create!(
          email: input[:email],
          name: input[:name],
          password: input[:password],
          password_confirmation: input[:password],
        )
      )
    end
  end
end
