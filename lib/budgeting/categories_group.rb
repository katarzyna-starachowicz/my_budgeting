module Budgeting
  class CategoriesGroup
    def initialize(id:, name:, budgeted:)
      @id = id
      @name = name
      @budgeted = budgeted
      @categories = []
    end

    def add_category(category)
      @categories << category
    end
  end
end
