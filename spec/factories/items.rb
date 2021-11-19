FactoryBot.define do
  factory :item do
    item_name { Faker::Lorem.sentence }
    item_explanation { Faker::Lorem.sentence }
    item_category_id { Faker::Number.between(from: 1, to: 3) }
    item_condition_id { Faker::Number.between(from: 1, to: 3) }
    delivery_fee_id { Faker::Number.between(from: 1, to: 3) }
    delivery_area_id { Faker::Number.between(from: 1, to: 3) }
    delivery_date_id { Faker::Number.between(from: 1, to: 3) }
    price { '333333' }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/image/sample1.png'), filename: 'sample1.png')
    end
  end
end
