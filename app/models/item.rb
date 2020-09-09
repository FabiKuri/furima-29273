class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :genre
  belongs_to_active_hash :itemdetail
  belongs_to_active_hash :shippingdetail
  belongs_to_active_hash :shippingprefecture
  belongs_to_active_hash :shipping_day

  
  belongs_to :user
  has_one :buyer
  has_one_attached :image

  validates :image, presence: true
  validates :name, :content, :genre_id, :itemdetail_id, :shippingdetail_id, :shippingprefecture_id, :shipping_day_id, :price, presence: true
  validates :genre_id, :itemdetail_id, :shippingdetail_id, :shippingprefecture_id, :shipping_day_id, numericality: { other_than: 1 }
end
