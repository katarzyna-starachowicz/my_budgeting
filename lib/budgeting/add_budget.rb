module Budgeting
  class AddBudget < Command
    attribute :budget_id, Types::UUID
    attribute :currency_id, Types::Coercible::Integer
    attribute :name, Types::Coercible::String

    alias :aggregate_id :budget_id
  end
end
