class CreateCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :categories do |t|
      t.uuid :uid, null: false, unique: true
      t.string :name, null: false, unique: true, limit: 140
      t.boolean :budgeted, default: false
      t.uuid :schema_id, null: false, unique: true
      t.uuid :categories_group_id, null: false, index: true

      t.timestamps
    end
  end
end
