FactoryBot.define do
  factory :product do
    title {Faker::Lorem.sentence}
    text {Faker::Lorem.sentence}
    product_category_id {2}
    product_status_id {2}
    burden_id {2}
    prefecture_id {2}
    days_id {2}
    price {1000}
    association :user

    after(:build) do |product|
      product.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png', content_type: 'image/png')
    end
  end
end
