class AddColumnNameToItems < ActiveRecord::Migration[7.0]
  def change
    add_column :items, :number_of_inventory, :integer
  end
end
