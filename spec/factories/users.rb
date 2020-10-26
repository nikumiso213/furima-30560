FactoryBot.define do
  factory :user do
    nick_name { Faker::Name::initials(number: 2) }
    email { Faker::Internet.free_email }
    password { "123abc" }
    password_confirmation { password}
    family_name { "黒川" }
    first_name { "卓也"}
    family_name_kana { "クロカワ" }
    first_name_kana { "タクヤ" }
    date_of_birth { Faker::Date.between(from: '1950-01-01', to: '2020-10-23') }
  end
end