FactoryBot.define do

  factory :form_object do
    post_code {'123-4567'}
    prefecture_id {1}
    municipality {'テスト'}
    address {'テスト'}
    phone_number{'00011112222'}
    token{'tok_c38aaf6f52d61db1be8e780f6886'}
    build_name {'アパート'}
  end
end
