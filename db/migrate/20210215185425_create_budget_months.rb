class CreateBudgetMonths < ActiveRecord::Migration[6.0]
  def change
    create_table :budget_months do |t|
      t.uuid :uid, null: false, unique: true
      t.date :month, null: false, unique: true
      t.uuid :budget_id, null: false, index: true
      t.decimal :budgeted, precision: 2
    end
  end
end
