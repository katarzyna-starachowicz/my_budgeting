module Budgeting
  class OnAddBudget
    include CommandHandler

    def initialize(schema_generator:)
      @schema_generator = schema_generator
    end

    def call(command)
      with_aggregate(Budget, command.aggregate_id) do |budget|
        schema = schema_generator.call
        budget.add_new_budget(command.name, command.currency_id, schema)
      end
    end

    private

    attr_accessor :schema_generator
  end
end
