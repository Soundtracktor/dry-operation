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
        transaction.value!
      end
    end
  end
end
