class User < ApplicationRecord
  has_many :items
  has_many :item_purchases

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
