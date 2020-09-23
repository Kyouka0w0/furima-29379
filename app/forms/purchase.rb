class Purchase
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :post_code, :shipment_id, :city, :house_number, :building_number, :phone_number, :token

  validates :post_code, presence: true, format: { with: /\A[0-9]{3}-[0-9]{4}\z/ }
  validates :shipment_id, numericality: { other_than: 1}
  validates :city, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/}
  validates :house_number, presence: true
  validates :phone_number, presence: true, format: {with: /\A\d{10,11}\z/}
  validates :token, presence: true
  validates :user_id, presence: true

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(post_code: post_code, shipment_id: shipment_id, city: city, house_number: house_number, building_number: building_number, phone_number: phone_number, order_id: order.id)
  end
end
