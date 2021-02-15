module Budgeting
  class Budget
    include AggregateRoot

    MissingName = Class.new(StandardError)
    MissingCurrency = Class.new(StandardError)
    MissingSchema = Class.new(StandardError)
    MissingFirstMonthData = Class.new(StandardError)

    def initialize(budget_id)
      @budget_id = budget_id
      @currency_id = nil
      @name = nil
      @budget_schema = []
      @first_month_data = {}
    end

    def add_new_budget(name, currency_id, schema, first_month_data)
      raise MissingName unless name
      raise MissingCurrency unless currency_id
      raise MissingSchema unless valid_schema?(schema)
      raise MissingFirstMonthData unless valid_first_month_data?(first_month_data)

      apply BudgetAdded.new(
        data: {
          budget_id: @budget_id,
          name: name,
          currency_id: currency_id,
          schema: schema,
          first_month_data: first_month_data
        }
      )
    end

    private

    on BudgetAdded do |event|
      @currency_id = event.data[:currency_id]
      @name = event.data[:name]
      @budget_schema = create_budget_schema(event.data[:schema])
      @first_month_data = event.data[:first_month_data] # TODO, ???
    end

    def create_budget_schema(schema)
      @budget_schema = schema.map do |categories_group_hash|
        categories_group = create_categories_group(categories_group_hash)

        add_categories_to_the_group(
          categories_group: categories_group,
          categories: categories_group_hash[:categories]
        )
      end
    end

    def create_categories_group(categories_group_hash)
      CategoriesGroup.new(
        id: categories_group_hash[:categories_group_id],
        name: categories_group_hash[:categories_group_name],
        budgeted: categories_group_hash[:budgeted]
      )
    end

    def add_categories_to_the_group(categories_group:, categories:)
      categories.each do |category_hash|
        category = create_category(category_hash)
        categories_group.add_category(category)
      end

      categories_group
    end

    def create_category(category_hash)
      Category.new(
        id: category_hash[:category_id],
        name: category_hash[:category_name],
        budgeted: category_hash[:budgeted]
      )
    end

    def valid_schema?(schema)
      # TODO, more fancy validation
      schema.present?
    end

    def valid_first_month_data?(first_month_data)
      first_month_data[:beginning_of_month].present? && first_month_data[:id].present?
    end
  end
end
