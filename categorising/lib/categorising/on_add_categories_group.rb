module Categorising
  class OnAddCategoriesGroup
    include CommandHandler

    def call(command)
      with_aggregate(Schema, command.aggregate_id) do |schema|
        schema.add_categories_group(
          categories_group_id: command.categories_group_id,
          name: command.name,
          budgeted: command.budgeted
        )
      end
    end
  end
end
