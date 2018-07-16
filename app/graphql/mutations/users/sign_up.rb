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

      def resolve(email: nil, name: nil, password: nil, organization_name: nil, source_token: nil)
        user = ::User.create!(
          email: email,
          name: name,
          password: password,
          password_confirmation: password,
        )

        organization = ::Organization.create!(name: organization_name)

        ::OrganizationMembership.create(user: user, organization: organization, role: "owner")

        subscription = ::StripeApi::Subscriptions::CreateService.new(source_token: source_token).call

        user.update!(subscription_paid_at: Time.current, subscription_uid: subscription.id) if subscription

        UserMailer.sign_up_email(user.id).deliver
        
        user
      end
    end
  end
end
