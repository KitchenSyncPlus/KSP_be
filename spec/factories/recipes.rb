FactoryBot.define do
  FactoryBot.define do
    factory :recipe do
      ingredients { Faker::Food.ingredient }
      url { Faker::Internet.url }
      source { Faker::Restaurant.name }
    end
  end
end