FactoryBot.define do
  factory :user do
    last_name             {Faker::Name.unique.name.split[0]}
    first_name            {Faker::Name.unique.name.split[1]}
    email                 {Faker::Internet.email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    association :store, factory: :store
  end
end