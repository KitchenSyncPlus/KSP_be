require 'rails_helper'

RSpec.describe EdamamService do
  let(:recipe_search) { EdamamService.recipe_search("avocado") }

  it 'can search products', :vcr do
    expect(recipe_search).to be_a(Hash)
    expect(recipe_search[:hits]).to be_a(Array)

    first_hit = recipe_search[:hits].first[:recipe]

    expect(first_hit).to be_a(Hash)

    expect(first_hit[:uri]).to be_a(String)
    expect(first_hit[:images][:THUMBNAIL][:url]).to be_a(String)
    expect(first_hit[:url]).to be_a(String)
    expect(first_hit[:yield]).to be_a(Float)
    expect(first_hit[:ingredientLines]).to be_a(Array)
    expect(first_hit[:ingredientLines]).to be_a(Array)
    expect(first_hit[:ingredientLines].first).to be_a(String)
    expect(first_hit[:ingredients]).to be_a(Array)

    first_hit[:ingredients].each do |ingredient|
      expect(ingredient[:food]).to be_a(String)
      expect(ingredient[:quantity]).to be_a(Float)
      expect(ingredient[:measure]).to be_a(String)
    end
  end
end