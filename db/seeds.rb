# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
schema_id = SecureRandom.uuid
schema = [
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
      },
      {
        category_name: 'MyBudgeting fee',
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

::Schema::Schema.create!(uid: schema_id)
::Budget::BudgetMonth.create!(
  schema_id: schema_id,
  month: Time.now.month,
  year: Time.now.year,
  uid: SecureRandom.uuid
)

schema_id =  ::Schema::Schema.last.uid
budget_month_id = ::Budget::BudgetMonth.last.uid
::Schema::CategoriesGroup.all.map do |cg|
  bmig_id = SecureRandom.uuid
  ::Budget::BudgetMonthItemsGroup.create!(
    uid: bmig_id,
    budget_month_id: budget_month_id,
    schema_id: schema_id,
    name: cg.name,
    categories_group_id: cg.uid
  )

  ::Schema::Category.where(categories_group_id: cg.uid).to_a.each do |c|
    ::Budget::BudgetMonthItem.create!(
      uid: SecureRandom.uuid,
      budget_month_id: budget_month_id,
      budget_month_items_group_id: bmig_id,
      schema_id: schema_id,
      name: c.name,
      category_id: c.uid
    )
  end
end


# schema.each do |categories_group|
#   ::Schema::CategoriesGroup.create!(
#     name: categories_group[:categories_group_name],
#     uid: categories_group[:categories_group_id],
#     schema_id: schema_id
#   )
#
#   categories_group[:categories].each do |category|
#     ::Schema::Category.create!(
#       name: category[:category_name],
#       uid: category[:category_id],
#       categories_group_id: categories_group[:categories_group_id],
#       schema_id: schema_id
#     )
#   end
# end
