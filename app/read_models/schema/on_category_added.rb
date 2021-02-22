module Schema
  class OnCategoryAdded
    def call(event)
      Category.create!(
        uid: event[:category_id],
        schema_id: event[:schema_id],
        categories_group_id: event[:categories_group_id],
        name: event[:name],
        budgeted: event[:budgeted]
      )

      categories_group = CategoriesGroup.find_by(uid: event[:categories_group_id])
      categories_group.update!(budgeted: categories_group.budgeted || event[:budgeted])
    end
  end
end
