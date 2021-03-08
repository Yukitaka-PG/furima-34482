FactoryBot.define do
  factory :destination_card do
    postal_code {'123-4567'}
    prefecture_id {2}
    city {'テスト'}
    address {'テスト１−１'}
    house_name {'テスト'}
    phone_number {'09012345678'}
    token {'sample'}
  end
end