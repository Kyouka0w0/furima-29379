class Item < ApplicationRecord
  belongs_to :user
  has_one :item_purchase
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :item_condition
  belongs_to_active_hash :postage_payer
  belongs_to_active_hash :shipment
  belongs_to_active_hash :preparation_day

  validates :name, :introduction, :image, presence: true

  validates :price, presence: true, format: { with: /\A[0-9]+\z/ }
  validates_inclusion_of :price, in: 300..9_999_999

  validates :category_id, :item_condition_id, :postage_payer_id, :shipment_id, :preparation_day_id, numericality: { other_than: 1 }
end
