module Categorising
  class CategoriesGroup
    attr_reader :id

    def initialize(id:, name:, budgeted: false)
      @id = id
      @name = name
      @budgeted = budgeted
      @categories = []
    end

    def add_category(category)
      @categories << category
    end

    def set_budgeted(category_budgeted)
      budgeted = budgeted || category_budgeted
    end

    private

    attr_accessor :budgeted
  end
end
