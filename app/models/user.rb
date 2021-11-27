class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :password, presence: true, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i }
  validates :nickname, presence: true
  validates :first_name, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ }
  validates :last_name, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ }
  validates :kana_first_name, presence: true, format: { with: /\A[ァ-ヶ]+\z/ }
  validates :kana_last_name, presence: true, format: { with: /\A[ァ-ヶ]+\z/ }
  validates :birthday, presence: true

  has_many :items
  has_many :user_purchases
end
