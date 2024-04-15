FactoryBot.define do
  factory :store do
    store_name    { Faker::Company.name }
    description   { Faker::Lorem.sentence }
    address       { Faker::Address.full_address }
    latitude      { Faker::Address.latitude }
    longitude     { Faker::Address.longitude }
    opening_hours { Faker::Lorem.sentence }
  end

  factory :user do
    last_name             {Faker::Name.unique.name.split[0]}
    first_name            {Faker::Name.unique.name.split[1]}
    email                 {Faker::Internet.email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    association :store, factory: :store
  end
end