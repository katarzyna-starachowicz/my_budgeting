class AddBudgetMonthItem < ActiveRecord::Migration[6.0]
  def change
    create_table :budget_month_items do |t|
      t.uuid :uid, null: false, unique: true
      t.uuid :budget_month_id, null: false, index: true
      t.uuid :budget_month_items_group_id, null: false, index: true
      t.decimal :budgeted, precision: 2, default: 0.0
      t.decimal :spent, precision: 2, default: 0.0
      t.decimal :avaiable, precision: 2, default: 0.0
      t.string :name, null: false, unique: true, limit: 140
      t.uuid :schema_id, null: false, index: true
      t.uuid :category_id, null: false, index: true

      t.timestamps
    end
  end
end
