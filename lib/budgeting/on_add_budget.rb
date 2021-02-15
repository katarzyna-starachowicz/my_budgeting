module Budgeting
  class OnAddBudget
    include CommandHandler

    def initialize(schema_generator:, first_month_data_generator:)
      @schema_generator = schema_generator
      @first_month_data_generator = first_month_data_generator
    end

    def call(command)
      with_aggregate(Budget, command.aggregate_id) do |budget|
        schema = schema_generator.call
        first_month_data = first_month_data_generator.call
        budget.add_new_budget(command.name, command.currency_id, schema, first_month_data)
      end
    end

    private

    attr_accessor :schema_generator, :first_month_data_generator
  end
end
