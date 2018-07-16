module Users
  class CreateOperation < BaseOperation
    def initialize

    end

    def call(input)
      if rand(2) == 1
        Success(
          ::User.create!(
            email: input[:email],
            name: input[:name],
            password: input[:password],
            password_confirmation: input[:password],
          )
        )
      else
        Failure(OpenStruct.new(user: { base: 'random failure' }))
      end
    end
  end
end
