class CreateDisplays < ActiveRecord::Migration[6.0]
  def change
    create_table :displays do |t|
      t.integer :genre_id,            null: false
      t.integer :condition_id,        null: false
      t.integer :delivety_fee_id,     null: false
      t.integer :day_id,              null: false
      t.integer :delivery_are_id,     null: false
      t.references :item,             null: false, foreign_key: true
      t.timestamps
    end
  end
end
