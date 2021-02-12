module Budgeting
  class OnAddBudget
    include CommandHandler

    def call(command)
      with_aggregate(Budget, command.aggregate_id) do |budget|
        budget.add_new_budget(command.name, command.currency_id)
      end
    end
  end
end
