module Budgets
  class OnBudgetAdded
    def call(event)
      Budget.create!(
        uid: event[:budget_id],
        name: event.data[:name],
        currency_id: event.data[:currency_id]
      )

      BudgetMonth.create!(
        uid: event[:first_month_data][:id],
        month: event[:first_month_data][:beginning_of_month],
        budget_id: event[:budget_id],
        budgeted: event[:schema].inject(0) { |sum,x| sum + x[:budgeted] }
      )

      event[:schema].each do |categories_group|
        CategoriesGroup.create!(
          name: categories_group[:categories_group_name],
          uid: categories_group[:categories_group_id],
          budget_month_id: event[:first_month_data][:id],
          budgeted: categories_group[:budgeted]
        )

        categories_group[:categories].each do |category|
          Category.create!(
            name: category[:category_name],
            uid: category[:category_id],
            category_id: categories_group[:categories_group_id],
            budgeted: category[:budgeted]
          )
        end
      end
    end
  end
end
