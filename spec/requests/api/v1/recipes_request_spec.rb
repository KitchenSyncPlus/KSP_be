require 'rails_helper'

RSpec.describe 'Recipes API' do
  xit 'can search for a recipe' do
    create_list(:recipe, 5)

    get '/api/v1/recipes'

    expect(response).to be_successful

    recipes = JSON.parse(response.body, symbolize_names: true)

    expect(recipes).to be_a(Hash)

    recipes[:data].each do |recipe|
      expect(recipe).to have_key(:id)
      expect(recipe[:id]).to be_a(String)

      expect(recipe[:type]).to eq("recipe")

      expect(recipe).to have_key(:attributes)
      expect(recipe[:attributes]).to be_a(Hash)
      expect(recipe[:attributes]).to have_key(:ingredients)
      expect(recipe[:attributes][:ingredients]).to be_a(String)
      expect(recipe[:attributes]).to have_key(:label)
      expect(recipe[:attributes][:label]).to be_a(String)
      expect(recipe[:attributes]).to have_key(:uri)
      expect(recipe[:attributes][:uri]).to be_a(String)
    end
  end

  it 'can search for a recipe', :vcr do
    group = create(:group)
    recipe = create(:recipe, group: group)

    get "/api/v1/recipes/#{recipe.id}"
  end
end
