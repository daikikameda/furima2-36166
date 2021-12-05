class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  has_one :user_purchase
  has_one_attached :image
  belongs_to :item_category
  belongs_to :item_condition
  belongs_to :delivery_fee
  belongs_to :delivery_area
  belongs_to :delivery_date
  has_many :comments

  validates :item_name,         presence: true
  validates :item_explanation,  presence: true
  validates :item_category_id,  presence: true, numericality: { other_than: 0, message: "can't be blank" }
  validates :item_condition_id, presence: true, numericality: { other_than: 0, message: "can't be blank" }
  validates :delivery_fee_id,   presence: true, numericality: { other_than: 0, message: "can't be blank" }
  validates :delivery_area_id,  presence: true, numericality: { other_than: 0, message: "can't be blank" }
  validates :delivery_date_id,  presence: true, numericality: { other_than: 0, message: "can't be blank" }
  validates :price,             presence: true, inclusion: { in: 300..9_999_999 }, format: /\A[0-9]+\z/, numericality: true
  validates :image,             presence: true
  validates :tag_name,          presence: true
end
