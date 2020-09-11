class Order < ApplicationRecord
belongs_to :user
belongs_to :item
has_one :address

with_options presence: true do
  validates :name, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "is invalid. Input full-width characters."}
  validates :name_reading, format: { with: /\A[ァ-ヶー－]+\z/, message: "is invalid. Input full-width katakana characters."}
  validates :nickname, format: { with: /\A[a-z0-9]+\z/i, message: "is invalid. Input half-width characters."}
end

attr_accessor :token
validates :token, presence: true
end
