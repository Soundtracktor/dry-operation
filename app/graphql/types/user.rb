# frozen_string_literal: true

class Types::User < Types::BaseObject
  field :id, Integer, null: false
  field :email, String, null: false
  field :name, String, null: true
  field :subscription_paid_at, String, null: true
  field :subscription_uid, String, null: true
  field :organization_memberships, Types::OrganizationMembership.connection_type, null: false

  def organization_memberships
    @object.organization_memberships
  end
end
