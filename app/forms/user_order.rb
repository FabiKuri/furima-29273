class UserOrder

  include ActiveModel::Model 
  attr_accessor :token, :postal_code, :city, :house_number, :prefecture_id, :building_name, :phone_number, :price, :item_id, :user_id
  #  attr_accessorでitem_id/user_idの定義が必要になります

  with_options presence: true do
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :phone_number, length: { maximum: 11}
  end
    validates :token, presence: true
    validates :prefecture_id, numericality: { other_than: 0, message: "can't be blank" }
    validates :city, presence: true
    validates :house_number, presence: true

  def save
    order = Order.create(item_id: item_id, user_id: user_id)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, house_number: house_number, building_name: building_name, phone_number: phone_number, order_id: order.id)
    # order_idの定義も必要です
  end

end
