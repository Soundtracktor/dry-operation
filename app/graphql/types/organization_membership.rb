# frozen_string_literal: true

class Types::OrganizationMembership < Types::BaseObject
  field :id, Integer, null: false
  field :role, String, null: false
  field :organization, Types::Organization, null: false
  field :user, Types::User, null: false

  def organization
    @object.organization
  end
end
