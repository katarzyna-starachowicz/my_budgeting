class CreateBudgetCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :budget_categories do |t|
      t.uuid :uid, null: false, unique: true
      t.string :name, null: false, unique: true, limit: 140
      t.uuid :category_id, null: false

      t.timestamps
    end
  end
end
