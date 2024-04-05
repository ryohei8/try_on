class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.string :item_name, null: false
      t.integer :size_id, null: false
      t.integer :price, null: false
      t.timestamps
    end
  end
end
