class CreateBudgetCategoriesGroups < ActiveRecord::Migration[6.0]
  def change
    create_table :budget_categories_groups do |t|
      t.uuid :uid, null: false, unique: true
      t.string :name, null: false, unique: true, limit: 140
      t.uuid :budget_month_id, null: false, index: true
      t.decimal :budgeted, precision: 2

      t.timestamps
    end
  end
end
