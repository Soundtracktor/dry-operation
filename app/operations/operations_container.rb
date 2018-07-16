require "dry/container"
require "dry/transaction"
require "dry/transaction/operation"

class OperationsContainer
  extend Dry::Container::Mixin

  namespace 'operations' do
    namespace "users" do
      register "create" do
        Users::CreateOperation.new
      end
    end

    namespace "organizations" do
      register "create" do
        Organizations::CreateOperation.new
      end
    end

    namespace "organization_memberships" do
      register "create" do
        OrganizationMemberships::CreateOperation.new
      end
    end

    namespace "subscriptions" do
      register "create" do
        Subscriptions::CreateOperation.new
      end
    end
  end
end
