FactoryBot.define do
  factory :store do
    store_name    { Faker::Company.name }
    description   { Faker::Lorem.sentence }
    address       { Faker::Address.full_address }
    latitude      { Faker::Address.latitude }
    longitude     { Faker::Address.longitude }
    opening_hours { Faker::Lorem.sentence }
  end
end
