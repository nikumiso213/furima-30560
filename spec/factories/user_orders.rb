FactoryBot.define do
  factory :user_order do
    token { 'tok_abcdefghijk00000000000000000' }
    postal_code { '123-4567' }
    prefecture_id { 2 }
    municipalities {'北九州市' }
    address { '八幡西区' }
    building_name { 'niku' }
    phone_number { '09012345678' }
  end
end
