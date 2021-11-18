class Display < ApplicationRecord
  belongs_to :item
  belongs_to :user
  belongs_to :genre_id
  belongs_to :condition_id
  belongs_to :delivery_fee_id
  belongs_to :area_id
  belongs_to :day_id


  validates :genre_id,              numericality: { other_than: 1 , message: "can't be blank"}
  validates :condition_id,          numericality: { other_than: 1 , message: "can't be blank"}
  validates :delivery_fee_id,       numericality: { other_than: 1 , message: "can't be blank"}
  validates :area_id,      numericality: { other_than: 1 , message: "can't be blank"}
  validates :day_id,                numericality: { other_than: 1 , message: "can't be blank"}
end