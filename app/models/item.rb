class Item < ApplicationRecord
  belongs_to :users
  has_one :item_purchase
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :postage
  belongs_to_active_hash :shipment
  belongs_to_active_hash :preparation

  validates :name, :introduction, :item_condition_id, :category_id,:price, presence: true
  validates :postage_payer_id, :shipment_id, :preparation_day_id, presence: true
  validates :category_id, :condition, :postage, :shipment, :preparation, numericality: { other_than: 1 } 
end
