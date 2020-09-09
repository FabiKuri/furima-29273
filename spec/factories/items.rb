FactoryBot.define do
  factory :item do 
    image                 {'public/images/sample.jpg'}
    name                   {Faker::Name.initials(number: 2)}
    content               {Faker::Lorem.sentence}
    genre_id                 { 2 }
    itemdetail_id            { 3 }
    shippingdetail_id        { 2 }
    shippingprefecture_id   { 2 }
    shipping_day_id          { 2 }
    price                 { 3000 }
    association :user
  end
end
