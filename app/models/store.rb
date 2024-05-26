class Store < ApplicationRecord
  has_many :items
  has_many :users

  with_options presence: true do
    validates :store_name
    validates :address
    validates :opening_hours
    validates :latitude
    validates :longitude
  end

  def self.ransackable_attributes(auth_object = nil)
    ["store_name"]
  end
  def self.ransackable_associations(auth_object = nil)
    ["items"]
  end
end
