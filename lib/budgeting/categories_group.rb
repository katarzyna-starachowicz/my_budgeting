module Budgeting
  class CategoriesGroup
    def initialize(id:, name:)
      @id = id
      @name = name
      @categories = []
    end

    def add_category(category)
      @categories << category
    end
  end
end
