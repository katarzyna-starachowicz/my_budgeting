module Budgeting
  class BudgetAdded < Event
    attribute :budget_id,   Types::UUID
    attribute :name,        Types::String
    attribute :currency_id, Types::ID
    attribute :schema,      Types::Array
  end
end
