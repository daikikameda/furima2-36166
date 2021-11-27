class Buy < ApplicationRecord
  belongs_to :user_purchase
  belongs_to :user

  #validates :post_code, presence: true, format: { with: (/\A\d{3}[-]\d{4}\z/) }
  #validates :delivery_area_id,  presence: true, numericality: { other_than: 0, message: "can't be blank" }
  #validates :city, presence: true
  #validates :addressline, presence: true
  #validates :phone_number, presence: true, format: { with: (/\A0[5789]0\d{4}\d{4}\z/)}
end
