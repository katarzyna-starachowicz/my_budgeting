class BudgetsController < ApplicationController
  def show
    @budget_month = Budget::BudgetMonth.first
    @budget_month_items_groups = Budget::BudgetMonthItemsGroup.where(budget_month_id: @budget_month.uid).map do |group|
      {
        name: group.name,
        budgeted: group.budgeted,
        spent: group.spent,
        avaiable: group.avaiable,
        items: Budget::BudgetMonthItem.where(
          budget_month_id: @budget_month.uid,
          budget_month_items_group_id: group.uid
        ).to_a
      }
    end
  end
end
