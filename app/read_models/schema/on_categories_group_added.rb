module Schema
  class OnCategoriesGroupAdded
    def call(event)
      CategoriesGroup.create!(
        uid: event[:categories_group_id],
        schema_id: event[:schema_id],
        name: event[:name],
        budgeted: event[:budgeted]
      )
    end
  end
end
