FactoryBot.define do
  factory :user do
    nickname {Faker::Name.last_name}
    email {Faker::Internet.free_email}
    password = Faker::Internet.password(min_length: 6)
    password {password}
    password_confirmation {password}
    family_name {Faker::Name.last_name}
    first_name {Faker::Name.first_name}
    family_name_kana {"ヤマダ"}
    first_name_kana {"タロウ"}
    birth_day {Faker::Date.birthday.strftime('%Y-%m-%d')}
  end
end
