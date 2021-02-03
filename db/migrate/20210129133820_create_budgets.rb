class CreateBudgets < ActiveRecord::Migration[6.0]
  def change
    create_table :budgets do |t|
      t.uuid :uid, null: false, unique: true
      t.string :name, null: false, unique: true, limit: 140

      t.timestamps
    end
  end
end
