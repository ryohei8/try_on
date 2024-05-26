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
    if auth_object == :consumer
      ["item_name", "category"]
    elsif auth_object == :inventory
      ["item_name", "category", "number_of_inventory", "store_id"]
    else
      super
    end
  end

  def self.ransackable_associations(auth_object = nil)
    ["store"]
  end
end

























































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































