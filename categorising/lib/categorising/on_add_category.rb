module Categorising
  class OnAddCategory
    include CommandHandler

    def call(command)
      with_aggregate(Schema, command.aggregate_id) do |schema|
        schema.add_category(
          category_id: command.category_id,
          categories_group_id: command.categories_group_id,
          name: command.name,
          budgeted: command.budgeted
        )
      end
    end
  end
end
