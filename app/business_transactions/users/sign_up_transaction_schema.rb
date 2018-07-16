# frozen_string_literal: true



module Users
  SignUpTransactionSchema = Dry::Validation.Schema do
    required(:email) { str? }
    optional(:name) { filled? > str? }
    required(:password) { str? && min_size?(8) }
    required(:organization_name) { str? }
    required(:source_token) { str? }
  end
end
