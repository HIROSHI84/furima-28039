FactoryBot.define do
  factory :item do
    name { 'aaa' }
    price { 999 }
    description { Faker::Lorem.sentence }
    category_id          { 2 }
    condition_id         { 2 }
    postage_payer_id     { 2 }
    shipping_area_id     { 2 }
    shipping_date_id     { 2 }
    association :user

    after(:build) do |item|
      item.item_image.attach(io: File.open('public/assets/furimaの素材/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
