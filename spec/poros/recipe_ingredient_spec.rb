require 'rails_helper'

RSpec.describe RecipeIngredient do
  
  before(:each) do
    data = {
      text: "5 tablespoons avocado oil",
      quantity: 5.0,
      measure: "tablespoon",
      food: "avocado oil",
      weight: 70.0,
      foodCategory: "oils",
      foodId: "food_bilwk0ibiic3g5bwwnqbnbvklgw0",
      image: "https://www.edamam.com/food-img/ce2/ce24db634b117a51aa525b29a110a318.jpg"
    }

    @recipe_ingredient = RecipeIngredient.new(data)
  end

  it 'exists' do
    expect(@recipe_ingredient).to be_a(RecipeIngredient)
    expect(@recipe_ingredient.text).to eq("5 tablespoons avocado oil")
    expect(@recipe_ingredient.quantity).to eq(5.0)
    expect(@recipe_ingredient.measure).to eq("tablespoon")
    expect(@recipe_ingredient.food).to eq("avocado oil")
    expect(@recipe_ingredient.weight).to eq(70.0)
    expect(@recipe_ingredient.foodCategory).to eq("oils")
    expect(@recipe_ingredient.foodId).to eq("food_bilwk0ibiic3g5bwwnqbnbvklgw0")
    expect(@recipe_ingredient.image).to eq("https://www.edamam.com/food-img/ce2/ce24db634b117a51aa525b29a110a318.jpg")
  end
end