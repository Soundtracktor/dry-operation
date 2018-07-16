module Organizations
  class CreateOperation < BaseOperation
    def initialize

    end

    def call(input)
      Success(
        ::Organization.create!(input)
      )
    end
  end
end
