FactoryBot.define do
  factory :item do
    item_name {Faker::Lorem.sentence}
    item_explanation {Faker::Lorem.sentence}
    item_category_id {Faker::Lorem.sentence}
    item_condition_id {Faker::Lorem.sentence}
    delivery_fee_id {Faker::Lorem.sentence}
    delivery_area_id {Faker::Lorem.sentence}
    delivery_date_id {Faker::Lorem.sentence}
    price {"333333"}
    association :user
    

    after(:build) do |item|
      item.image.attach(io: File.open('public/image/sample1.png'), filename: 'sample1.png')
    end
  end
end
