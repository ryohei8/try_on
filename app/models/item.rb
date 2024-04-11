class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :size
  belongs_to :store


  # with_options presence: true do
  #   validates :item_name, :price, :number_of_inventory
  #   #sizeの選択が「---」の時は保存できないようにする
  #   validates :size_id, numericality: { other_than: 1 , message: "can't be blank" } 
  end
