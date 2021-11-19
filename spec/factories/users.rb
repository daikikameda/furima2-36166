FactoryBot.define do
  factory :user do
    nickname               { 'test' }
    email                  { 'test@test.com' }
    password               { '111111a' }
    password_confirmation  { password }
    first_name             { '山田' }
    last_name              { '太郎' }
    kana_first_name        { 'ヤマダ' }
    kana_last_name         { 'タロ' }
    birthday               { '1977-12-25' }
  end
end
