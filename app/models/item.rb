class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :size
  belongs_to :store

  enum category: { メンズ: 0, ウィメンズ: 1, キッズ: 2 }

  with_options presence: true do
    validates :item_name, :color, :price, :number_of_inventory, :category
    #sizeの選択が「---」の時は保存できないようにする
    validates :size_id, numericality: { other_than: 1 , message: "を選択してください" } 
  end

  def self.ransackable_attributes(auth_object = nil)
    ["item_name", "number_of_inventory", "store_id"]
  end
end
