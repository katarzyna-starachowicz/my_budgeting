class BudgetsController < ApplicationController
  def index
    @budgets = ::Budgets::Budget.all
  end
end
