class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :product_status
  belongs_to_active_hash :delivery
  belongs_to_active_hash :area
  belongs_to_active_hash :shipping_day

  with_options presence: true do
    validates :image
    validates :name
    validates :description
    validates :price, numericality: { greater_than: 299, less_than: 10_000_000 }
  end

  with_options numericality: ( greater_than: 1, message: 'を選んでください') do
    validates :delivery_id,       presence: true
    validates :product_status_id, presence: true
    validates :category_id,       presence: true
    validates :area_id,           presence: true
    validates :shipping_day_id,   presence: true
  end
  belongs_to :user
  has_many   :orders
  has_many   :shipping_addresses
  
  has_one_attached :image
end
