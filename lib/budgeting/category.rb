module Budgeting
  class Category
    def initialize(id:, name:, budgeted:)
      @id = id
      @name = name
      @budgeted = budgeted
    end
  end
end
