class Item < ApplicationRecord
  belongs_to :user
  has_one :item_purchase
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :postage
  belongs_to_active_hash :shipment
  belongs_to_active_hash :preparation

  validates :name, :introduction, :image, presence: true
  validates :price, presence: true
  class Player < ApplicationRecord
  validates :price, numericality: true
  validates :games_played, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }
  end
  validates :category_id, :item_condition_id, :postage_payer_id, :shipment_id, :preparation_day_id, numericality: { other_than: 1 } 
end
