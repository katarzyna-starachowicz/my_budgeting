class CreateSchema < ActiveRecord::Migration[6.0]
  def change
    create_table :schemas do |t|
      t.uuid :uid, null: false, unique: true
    end
  end
end
