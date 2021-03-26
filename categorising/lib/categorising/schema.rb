module Categorising
  class Schema
    include AggregateRoot

    MissingName            = Class.new(StandardError)
    MissingCategoriesGroup = Class.new(StandardError)
    MissingCategoryId      = Class.new(StandardError)

    def initialize(schema_id)
      @schema_id = schema_id
      @categories_groups = []
    end

    def add_categories_group(categories_group_id:, name:, budgeted:)
      raise MissingName unless name
      raise MissingCategoriesGroup unless categories_group_id

      apply CategoriesGroupAdded.new(
        schema_id: @schema_id,
        categories_group_id: categories_group_id,
        name: name,
        budgeted: budgeted
      )
    end

    def add_category(category_id:, categories_group_id:, name:, budgeted:)
      raise MissingCategoryId unless category_id
      raise MissingName unless name
      raise MissingCategoriesGroup unless categories_group_id

      apply CategoryAdded.new(
        schema_id: @schema_id,
        category_id: category_id,
        categories_group_id: categories_group_id,
        name: name,
        budgeted: budgeted
      )
    end

    private

    on CategoriesGroupAdded do |event|
      @categories_groups << CategoriesGroup.new(
        id: event.data[:categories_group_id],
        name: event.data[:name],
        budgeted: event.data[:budgeted]
      )
    end

    on CategoryAdded do |event|
      category = Category.new(
        id: event.data[:category_id],
        categories_group_id: event.data[:categories_group_id],
        name: event.data[:name],
        budgeted: event.data[:budgeted]
      )

      category_group = find_categories_group(event.data[:categories_group_id])

      category_group.add_category(category)
      category_group.set_budgeted(event.data[:budgeted])
    end

    def find_categories_group(id)
      @categories_groups.find { |categories_group| categories_group.id == id }
    end
  end
end
