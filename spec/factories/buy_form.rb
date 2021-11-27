FactoryBot.define do
  factory :buy_form do
    post_code  {'112-2222'}
    delivery_area_id {Faker::Number.between(from: 1, to: 31)}
    city       {'港区品川'}
    addressline {'2-2-2'}
    building   {''}
    phone_number {'09012445678'}
    token {"tok_abcdefghijk00000000000000000"}
  end
end
