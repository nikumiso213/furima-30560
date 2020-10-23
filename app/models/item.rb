class Item < ApplicationRecord
  belongs to :user
  has_many   :orders
  has_many   :shipping_addresses
end
