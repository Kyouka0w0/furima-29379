class User < ApplicationRecord
  has_many :items
  has_many :item_purchases

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :email, presence: true, uniqueness: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :first_name_kana, presence: true
  validates :first_name_kana, presence: true
  validates :birthday, presence: true
end
