class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :item_purchases

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]{6,}+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX
  validates :nickname, presence: true
  validates :email, presence: true
  with_options presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: '全角文字を使用してください' } do
    validates :first_name
    validates :last_name
    validates :first_name_kana
    validates :last_name_kana
    validates :birthday, presence: true
  end
  validates :birthday, presence: true
end