FactoryBot.define do
  factory :item do
    association :user
    name                { Faker::Men.name}
    description         { Faker::Men.text}
    price               {1000}
    delivery_id         {2}
    product_status_id   {2}
    category_id         {2}
    shipping_days_id    {2}
    area_id             {2}
    after(:build) do |item|
      item.image.attach(io: File.open('app/assets/images/flag.png'), filename: 'test.png', content_type: 'image/png')
    end
  end
end
