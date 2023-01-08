require 'rails_helper'

RSpec.describe RecipeIngredient do
  it 'exists' do 
    data = {
      quantity: 5.0,
      measure: "tablespoon",
      food: "avocado oil",
      weight: 70.0
    }

    recipe_ingredient = RecipeIngredient.new(data)

    expect(recipe_ingredient).to be_a(RecipeIngredient)
    expect(recipe_ingredient.quantity).to eq(5.0)
    expect(recipe_ingredient.measure).to eq("tablespoon")
    expect(recipe_ingredient.food).to eq("avocado oil")
    expect(recipe_ingredient.weight).to eq(70.0)
  end


end