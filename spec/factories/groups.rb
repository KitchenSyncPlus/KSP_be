FactoryBot.define do
  factory :group do
    name { Faker::Color.color_name }
    about { Faker::Company.bs }
  end
end
