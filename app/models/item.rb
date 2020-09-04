class Item < ApplicationRecord
  belongs_to :users
  has_one :item_purchase
end
