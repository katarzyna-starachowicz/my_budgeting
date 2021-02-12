module Budgets
  class OnBudgetAdded
    def call(event)
      Budget.create!(
        uid: event[:budget_id],
        name: event.data[:name],
        currency_id: event.data[:currency_id]
      )
    end
  end
end
