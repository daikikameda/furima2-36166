class BuyForm
  include ActiveModel::Model
  
  attr_accessor :post_code, :delivery_area_id, :city, :addressline, :phone_number, :item_id, :user_id, :building, :token, :buy, :user_purchase

  validates :delivery_area_id,  presence: true, numericality: { other_than: 0, message: "can't be blank" }

  with_options presence: true do
    validates :item_id
    validates :user_id
    validates :post_code, format: { with: (/\A\d{3}[-]\d{4}\z/) }
    validates :city
    validates :addressline
    validates :phone_number, format: { with: (/\A0[5789]0\d{4}\d{4}\z/)}
    validates :token
  end
  
  def save
    Buy.create(post_code: post_code, delivery_area_id: delivery_area_id, city: city, addressline: addressline, building: building, phone_number: phone_number, user_purchase_id: user_purchase)
    user_purchase = UserPurchase.create(item_id: item_id, user_id: user_id)
  end
end
