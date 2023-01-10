FactoryBot.define do
  factory :recipe_ingredient do
    name { "MyString" }
    quantity { 1.5 }
    price { 1.5 }
    user_id { nil }
    recipe_id { nil }
  end
end
