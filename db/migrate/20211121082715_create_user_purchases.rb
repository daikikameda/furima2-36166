class CreateUserPurchases < ActiveRecord::Migration[6.0]
  def change
    create_table :user_purchases do |t|
      t.references       :user
      t.references       :item

      t.timestamps
    end
  end
end
