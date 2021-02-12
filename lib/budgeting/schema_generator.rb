module Budgeting
  class SchemaGenerator
    def call
      [
        {
          categories_group_name: 'Every Day Expenses',
          categories_group_id: SecureRandom.uuid,
          categories: [
            {
              category_name: 'Grocery Shopping',
              category_id: SecureRandom.uuid
            },
            {
              category_name: 'Rent',
              category_id: SecureRandom.uuid
            }
          ]
        },
        {
          categories_group_name: 'Fun Money',
          categories_group_id: SecureRandom.uuid,
          categories: [
            {
              category_name: 'Secret',
              category_id: SecureRandom.uuid
            },
            {
              category_name: 'Cinema',
              category_id: SecureRandom.uuid
            }
          ]
        }
      ]
    end
  end
end
