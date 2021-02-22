module Categorising
  class CategoriesGroupAdded < Event
    attribute :schema_id, Types::UUID
    attribute :categories_group_id, Types::UUID
    attribute :name, Types::Coercible::String
    attribute :budgeted, Types::Bool
  end
end
