# frozen_string_literal: true

module Mutations
  module Users
    class SignUp < GraphQL::Schema::Mutation
      argument :email, String, required: false
      argument :name, String, required: false
      argument :password, String, required: false
      argument :organization_name, String, required: false
      argument :source_token, String, required: false
      type Types::User

      def resolve(args)
        transaction = ::Users::SignUpTransaction.new.call(args)
        return transaction.value! if transaction.success?

        GraphQL::ExecutionError.new transaction.failure
      end
    end
  end
end
