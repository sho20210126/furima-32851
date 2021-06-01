FactoryBot.define do
  factory :product do
    after(:build) do |product|
      product.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
    product_name {"テスト"}
    product_description {"テスト"}
    product_price {300}
    product_status_id {1}
    delivery_cost_id {1}
    prefecture_id {1}
    delivery_day_id {1}
    delivery_category_id {1}
    association :user
  end
end
