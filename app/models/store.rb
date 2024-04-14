class Store < ApplicationRecord
  has_many :items
  has_many :users

  with_options presence: true do
    validates :store_name
    validates :address
    validates :latitude
    validates :longitude
    validates :opening_hours
  end
end
