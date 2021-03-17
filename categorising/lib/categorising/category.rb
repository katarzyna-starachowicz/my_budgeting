module Categorising
  class Category
    attr_reader :id

    def initialize(id:, categories_group_id:, name:, budgeted: false)
      @id = id
      @categories_group_id = categories_group_id
      @name = name
      @budgeted = budgeted
      @categories = []
    end

    def set_budgeted(category_budgeted)
      budgeted = budgeted || category_budgeted
    end

    private

    attr_accessor :budgeted
  end
end
