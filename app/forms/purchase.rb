class Purchase

  include ActiveModel::Model
  attr_accessor :price, :user_id, :item_id, :item_purchases_id, :post_code, :prefecture_code_id, :city, :house_number, :building_number, :phone_number

  validates :postal_code, presence: true, format: {with: /\A[0-9]{3}-[0-9]{4}\z/}
  validates :prefecture, numericality: { other_than: 0}
  validates :city, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/}
  validates :house_number, presence: true
  validates :phone_number, presence: true, format: {with: /\A\d{10,11}\z/}

  def save
    orders = Order.create(price: price, user_id: user.id, item_id: item.id)
    Address.create(postal_code: postal_code, prefecture_code_id: prefecture_code_id, city: city, house_number: house_number, building_number: building_number,order_id: order.id)
  end

end