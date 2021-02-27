FactoryBot.define do
  factory :user do
    nickname { 'test1' }
    email { 'test1@test.com' }
    password = Faker::Internet.password(min_length: 6)
    password { password }
    password_confirmation { password }
    first_name { '陸太郎' }
    family_name { '山田' }
    first_name_katakana { 'リクタロウ' }
    family_name_katakana { 'ヤマダ' }
    birthday { '1930-01-01' }
  end
end
