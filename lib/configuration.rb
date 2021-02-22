class Configuration
  def call(event_store, command_bus)
    event_store.subscribe(::Schema::OnCategoryAdded, to: [::Categorising::CategoryAdded])
    event_store.subscribe(::Schema::OnCategoriesGroupAdded, to: [::Categorising::CategoriesGroupAdded])

    command_bus.register(::Categorising::AddCategoriesGroup, ::Categorising::OnAddCategoriesGroup.new)
    command_bus.register(::Categorising::AddCategory, ::Categorising::OnAddCategory.new)
  end
end
