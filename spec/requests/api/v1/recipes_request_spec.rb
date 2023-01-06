require 'rails_helper'

RSpec.describe 'Recipes API' do
  it 'can search for a recipe' do
    create_list(:recipe, 5)

    get '/api/v1/recipes/search'

    expect(response).to be_successful
  end
end