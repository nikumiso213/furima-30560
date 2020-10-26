FactoryBot.define do
  factory :item do
    user
    name                { "tikuwa"}
    description         { "new item"}
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
