class User < ApplicationRecord
  has_secure_password
  has_many :organization_memberships
end
