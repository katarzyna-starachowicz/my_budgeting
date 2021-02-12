class Configuration
  def call(event_store, command_bus)
    event_store.subscribe(::Budgets::OnBudgetAdded, to: [::Budgeting::BudgetAdded])

    command_bus.register(
      ::Budgeting::AddBudget,
      ::Budgeting::OnAddBudget.new(schema_generator: Rails.configuration.schema_generator.call)
    )
  end
end
