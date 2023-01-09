require 'rails_helper'

RSpec.describe Recipe do
  before(:each) do
    data = {
      label: "Avocado Crema",
      uri: "http://www.edamam.com/ontologies/edamam.owl#recipe_9d2cd31fb0cc43333375580d3c46db3d",
      ingredients: ["1 cup sour cream or crema", "1 avocado, peeled, pitted, and cubed", "Kosher salt and freshly ground black pepper, to taste"] 
        # {
        #     text: "1 cup sour cream or crema",
        #     quantity: 1.0,
        #     measure: "cup",
        #     food: "sour cream",
        #     weight: 230.0,
        #     foodCategory: "Dairy",
        #     foodId: "food_adp9fcubzl3lr7bcvzn3rbfiiiwq",
        #     image: "https://www.edamam.com/food-img/f9d/f9d6183267b041b0aff9a10b89c9c15f.jpg"
        # },
        # {
        #     "text": "1 avocado, peeled, pitted, and cubed",
        #     "quantity": 1.0,
        #     "measure": "<unit>",
        #     "food": "avocado",
        #     "weight": 201.0,
        #     "foodCategory": "fruit",
        #     "foodId": "food_b0yuze4b1g3afpanijno5abtiu28",
        #     "image": "https://www.edamam.com/food-img/984/984a707ea8e9c6bf5f6498970a9e6d9d.jpg"
        # },
        # {
        #     "text": "Kosher salt and freshly ground black pepper, to taste",
        #     "quantity": 0.0,
        #     "measure": "<unit>",
        #     "food": "Kosher salt",
        #     "weight": 2.586,
        #     "foodCategory": "Condiments and sauces",
        #     "foodId": "food_a1vgrj1bs8rd1majvmd9ubz8ttkg",
        #     "image": "https://www.edamam.com/food-img/694/6943ea510918c6025795e8dc6e6eaaeb.jpg"
        # }
    }

    @recipe = Recipe.new(data)
  end

  it 'exists' do
    expect(@recipe).to be_a(Recipe)
    expect(@recipe.label).to eq("Avocado Crema")
    expect(@recipe.uri).to eq("http://www.edamam.com/ontologies/edamam.owl#recipe_9d2cd31fb0cc43333375580d3c46db3d")
    expect(@recipe.ingredients.count).to eq(3)
  end
end