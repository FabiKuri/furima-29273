FactoryBot.define do
  factory :user_order do
    token {'1234567890'}
    postal_code { '123-4567' }
    prefecture_id { 1 }
    city { '東京都' }
    house_number { '1-1' }
    building_name { '東京ハイツ' }
    phone_number {'08012345678'}
  end
end
