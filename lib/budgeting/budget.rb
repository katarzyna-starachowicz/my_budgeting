module Budgeting
  class Budget
    include AggregateRoot

    MissingName = Class.new(StandardError)
    MissingCurrency = Class.new(StandardError)

    def initialize(id)
      @id = id
      @currency_id = nil
      @name = nil
    end

    def add_new_budget(name, currency_id)
      raise MissingName unless name
      raise MissingCurrency unless currency_id
      apply BudgetAdded.new(data: { budget_id: @id, name: name, currency_id: currency_id })
    end

    on BudgetAdded do |event|
      @currency_id = event.data[:currency_id]
      @name = event.data[:name]
    end
  end
end
