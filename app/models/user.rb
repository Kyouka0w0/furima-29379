class User < ApplicationRecord
  has_many :items
  has_many :item_purchases

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  devise :validatable, password_length: 6..12
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: 'passwordには英字と数字の両方を含めて設定してください'
  validates :nickname, presence: true
  validates :email, presence: true, uniqueness: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :first_name_kana, presence: true
  validates :first_name_kana, presence: true
  validates :birthday, presence: true
end
