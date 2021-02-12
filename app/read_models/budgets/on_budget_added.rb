module Budgets
  class OnBudgetAdded
    def call(event)
      Budget.create!(
        uid: event[:budget_id],
        name: event.data[:name],
        currency_id: event.data[:currency_id]
      )

      event[:schema].each do |categories_group|
        CategoriesGroup.create!(
          name: categories_group[:categories_group_name],
          uid: categories_group[:categories_group_id],
          budget_id: event[:budget_id]
        )

        categories_group[:categories].each do |category|
          Category.create!(
            name: category[:category_name],
            uid: category[:category_id],
            category_id: categories_group[:categories_group_id]
          )
        end
      end
    end
  end
end
