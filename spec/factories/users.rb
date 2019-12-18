FactoryBot.define do
  factory :user do
    id {"1"}
    nickname {"bot"}
    password = Faker::Internet.password(min_length: 7)
    email {Faker::Internet.free_email}
    password {password}
    last_name {"d"}
    first_name {"e"}
    last_name_kana {"dd"}
    first_name_kana {"ee"}
    phone_number {"000"}
  end
end