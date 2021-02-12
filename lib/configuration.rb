class Configuration
  def call(event_store, command_bus)
    event_store.subscribe(::Budgets::OnBudgetAdded, to: [::Budgeting::BudgetAdded])

    command_bus.register(::Budgeting::AddBudget, ::Budgeting::OnAddBudget.new)
  end
end
