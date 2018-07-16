require "dry/transaction"

class BaseTransaction
  include Dry::Transaction
  include Dry::Transaction(container: OperationsContainer)
end
