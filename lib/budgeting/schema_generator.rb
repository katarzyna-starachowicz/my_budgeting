module Budgeting
  class SchemaGenerator
    def call
      [
        {
          categories_group_name: 'Every Day Expenses',
          categories_group_id: SecureRandom.uuid,
          budgeted: 10.0,
          categories: [
            {
              category_name: 'Grocery Shopping',
              category_id: SecureRandom.uuid,
              budgeted: 0.0
            },
            {
              category_name: 'Rent',
              category_id: SecureRandom.uuid,
              budgeted: 0.0
            },
            {
              category_name: 'MyBudgeting fee',
              category_id: SecureRandom.uuid,
              budgeted: 10.0
            }
          ]
        },
        {
          categories_group_name: 'Fun Money',
          categories_group_id: SecureRandom.uuid,
          budgeted: 0.0,
          categories: [
            {
              category_name: 'Secret',
              category_id: SecureRandom.uuid,
              budgeted: 0.0
            },
            {
              category_name: 'Cinema',
              category_id: SecureRandom.uuid,
              budgeted: 0.0
            }
          ]
        }
      ]
    end
  end
end
