module OrganizationMemberships
  class CreateOperation < BaseOperation
    def initialize

    end

    def call(input)
      if rand(3) == 1
        Failure("Something happened")
      else
        Success(
          ::OrganizationMembership.create!(input)
        )
      end
    end
  end
end
