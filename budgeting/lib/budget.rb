require 'aggregate_root'

module Budgeting
  class Budget
    include AggregateRoot

    AccountAlreadySetUp = Class.new(StandardError)

    def initialize(id)
      @id = id
      @budget_accounts = []
      @budget_categories = []
    end

    def set_up_account(account_id)
      raise AccountAlreadySetUp if @budget_accounts.inlcude?(account_id)
      apply AccountSetUpInBudget.new(data: { budget_id: @id, account_id: account_id })
    end

    on AccountSetUpInBudget do |event|
      account_id = event.data[:account_id]
      budget_account = find_budget_account(account_id)
      unless budget_account
        budget_account = create_budget_account(account_id)
        @budget_accounts << budget_account
      end
    end

    private

    def find_budget_account(account_id)
      @budget_accounts.find { |budget_account| budget_account.account_id == acoount_id }
    end

    def create_budget_account(account_id)
      BudgetAccount.new(account_id)
    end
  end
end

