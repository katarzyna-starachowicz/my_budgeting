class BudgetsController < ApplicationController
  def index
    @budgets = ::Budgets::Budget.all
  end

  def new
    @budget_id  = SecureRandom.uuid
    @currencies  = ::Currency.order(:code)
  end

  def create
    cmd = ::Budgeting::AddBudget.new(
      budget_id: params[:budget_id],
      name: params[:name],
      currency_id: params[:currency_id]
    )
    command_bus.(cmd)
    redirect_to budget_path(::Budgets::Budget.find_by_uid(cmd.budget_id))
  end

  def show
    @budget = ::Budgets::Budget.find(params[:id])
    @currency_code = ::Currency.find(@budget.currency_id).code
  end
end
