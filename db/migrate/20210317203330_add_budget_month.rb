class AddBudgetMonth < ActiveRecord::Migration[6.0]
  def change
    create_table :budget_months do |t|
      t.uuid :uid, null: false, unique: true
      t.uuid :schema_id, null: false, unique: true
      t.integer :month, null: false
      t.integer :year

      t.timestamps
    end
  end
end
