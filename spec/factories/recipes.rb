FactoryBot.define do
  FactoryBot.define do
    factory :recipe do
      ingredients { Faker::Food.ingredient }
      uri { Faker::Internet.url }
      label { Faker::Restaurant.name }
    end
  end
end