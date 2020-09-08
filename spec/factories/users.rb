FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    family_name           {'山田'}
    first_name            {'太郎'}
    family_name_reading   {'ヤマダ'}
    first_name_reading    {'タロウ'}
    birthday              {Faker::Date.backward(days: 23)}
  end
end