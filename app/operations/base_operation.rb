require "dry/container"
require "dry/transaction"
require "dry/transaction/operation"

class BaseOperation
  include Dry::Transaction::Operation
end
