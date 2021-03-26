module Categorising
  class AddCategoriesGroup < Command
    attribute :schema_id, Types::UUID
    attribute :categories_group_id, Types::UUID
    attribute :name, Types::Coercible::String
    attribute :budgeted, Types::Bool

    alias :aggregate_id :schema_id
  end
end
