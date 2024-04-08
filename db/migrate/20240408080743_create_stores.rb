class CreateStores < ActiveRecord::Migration[7.0]
  def change
    create_table :stores do |t|
      t.string :store_name, null: false
      t.text   :description, null: false
      t.text   :address, null: false
      t.float  :latitude, null: false
      t.float  :longitude, null: false
      t.string :opening_hours, null: false
      t.timestamps
    end
  end
end
