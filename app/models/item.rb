class Item < ApplicationRecord
  belongs_to :users
  has_one :item_purchase

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category, :condition, :postage, :shipment, :preparation

  #空の投稿を保存できないようにする
  #validates :name, :introduction, :category, presence: true
  #ジャンルの選択が「--」の時は保存できないようにする
  #validates :category_id, numericality: { other_than: 1 } 
end
