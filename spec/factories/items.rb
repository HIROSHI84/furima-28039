FactoryBot.define do
  factory :item do
    name { 'aaa' }
    price { '9,999,999' }
    description   {Faker::Lorem.sentence}
    category_id          {2}
    condition_id         {2}
    postage_payer_id     {2}         
    shipping_area_id     {2}
    shipping_date_id     {2}
  end
end