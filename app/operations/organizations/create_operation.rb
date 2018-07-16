module Organizations
  class CreateOperation < BaseOperation
    def initialize

    end

    def call(input)
      Success(
        ::Organization.create!(name: input[:organization_name])
      )
    end
  end
end
