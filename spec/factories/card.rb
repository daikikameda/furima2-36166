FactoryBot.define do
  factory :card do
    number {'4242424242424242'}
    month {'12'}
    year {'23'}
    card_cvc {'123'}
    association :buy_form, factory: :buy_form
  end
end