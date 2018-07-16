module OrganizationMemberships
  class CreateOperation < BaseOperation
    def initialize

    end

    def call(input)
      Success(
        ::OrganizationMembership.create!(input)
      )
    end
  end
end
