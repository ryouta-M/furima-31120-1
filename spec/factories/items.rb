FactoryBot.define do
  factory :item do
    title { Faker::Lorem.word }
    text { Faker::Lorem.sentence }
    price { Faker::Number.number(digits: 5) }
    category_id { Faker::Number.between(from: 2, to: 11) }
    condition_id { Faker::Number.between(from: 2, to: 7) }
    postage_payer_id { Faker::Number.between(from: 2, to: 3) }
    prefecture_id { Faker::Number.between(from: 1, to: 47) }
    preparation_day_id { Faker::Number.between(from: 2, to: 4) }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.jpg'), filename: 'test_image.png')
    end
  end
end
