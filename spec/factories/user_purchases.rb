FactoryBot.define do
  factory :user_purchase do
    association :user, factory: :buy_form
    association :item, factory: :buy_form
  end
end
