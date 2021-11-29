class Buy < ApplicationRecord
  belongs_to :user_purchase
  belongs_to :user

end
