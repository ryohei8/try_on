class AddColorToItems < ActiveRecord::Migration[7.0]
  def change
    add_column :items, :color, :string
  end
end
