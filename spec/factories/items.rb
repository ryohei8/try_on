FactoryBot.define do
  factory :item do
    item_name           {Faker::Commerce.product_name}
    price               {Faker::Commerce.price}
    size                {Size.all.sample}
    color               {Faker::Color.color_name}
    number_of_inventory {Faker::Number.between(from: 1, to: 1000)}
    association :store, factory: :store
  end
end
