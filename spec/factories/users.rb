FactoryBot.define do
  factory :user do
    nick_name { Faker::Name::initials(number: 2) }
    email { Faker::Internet.free_email }
    password { Faker::Internet.password(min_length: 6, mix_case: true) }
    password_confirmation { password}
    family_name { Gimei.last.kanji }
    first_name { Gimei.first.kanji }
    family_name_kana { Gimei.last.katakana }
    first_name_kana { Gimei.first.katakana }
    date_of_birth { Faker::Date.between(fron: '1950-01-01', to: '2020-10-23') }
  end
end