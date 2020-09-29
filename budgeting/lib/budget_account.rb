module Budget
  class BudgetAccount
    attr_reader :account_id

    def initialize(account_id)
      @account_id = account_id
    end
  end
end

