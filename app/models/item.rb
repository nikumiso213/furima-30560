class Item < ApplicationRecord

  with_options presence: true do
    validates :image
    validates :name
    validates :description
    validates :price
  end

  
  belongs to :user
  has_many   :orders
  has_many   :shipping_addresses
  
  has_one_attached :image
end
