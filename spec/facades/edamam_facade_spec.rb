require 'rails_helper'

RSpec.describe EdamamFacade do
  let(:recipe_search) { EdamamFacade.recipe_search("avocado") }
  let(:recipe_show) { EdamamFacade.recipe_show("f4902b0396d82272658accbf8bba92c1") }
  let(:recipe_ingredients) { EdamamFacade.recipe_ingredients("f4902b0396d82272658accbf8bba92c1") }

  context "#recipe_search" do
    it 'extracts relevant data', :vcr do
      expect(recipe_search).to be_a(Hash)
      expect(recipe_search[:hits]).to be_a(Array)

      first_hit = recipe_search[:hits].first

      expect(first_hit).to be_a(Hash)

      expect(first_hit[:ext_id]).to be_a(String)
      expect(first_hit[:label]).to be_a(String)
      expect(first_hit[:thumbnail_url]).to be_a(String)
      expect(first_hit[:source_url]).to be_a(String)
      expect(first_hit[:yield]).to be_a(Float)
      expect(first_hit[:ingredientLines]).to be_a(Array)
      expect(first_hit[:ingredientLines].first).to be_a(String)
    end
  end

  context "#recipe_show" do
    it 'extracts relevant data', :vcr do
      expect(recipe_show).to be_a(Hash)

      expect(recipe_show[:ext_id]).to be_a(String)
      expect(recipe_show[:label]).to be_a(String)
      expect(recipe_show[:image]).to be_a(String)
      expect(recipe_show[:source_url]).to be_a(String)
      expect(recipe_show[:yield]).to be_a(Float)
      expect(recipe_show[:ingredientLines]).to be_a(Array)
      expect(recipe_show[:ingredientLines].first).to be_a(String)
      expect(recipe_show[:ingredients]).to be_a(Array)

      recipe_show[:ingredients].each do |ingredient|
        expect(ingredient[:food]).to be_a(String)
        expect(ingredient[:quantity]).to be_a(Float)
        expect(ingredient[:measure]).to be_a(String)
      end
    end
  end


  context "#recipe_ingredients" do
    it 'extracts relevant data', :vcr do
      expect(recipe_ingredients).to be_a(Hash)

      expect(recipe_ingredients[:ext_id]).to be_a(String)
      expect(recipe_ingredients[:yield]).to be_a(Float)
      expect(recipe_ingredients[:ingredientLines]).to be_a(Array)
      expect(recipe_ingredients[:ingredientLines].first).to be_a(String)
      expect(recipe_ingredients[:ingredients]).to be_a(Array)

      recipe_ingredients[:ingredients].each do |ingredient|
        expect(ingredient[:food]).to be_a(String)
        expect(ingredient[:quantity]).to be_a(Float)
        expect(ingredient[:measure]).to be_a(String)
        expect(ingredient[:foodID]).to be_a(String)
      end
    end
  end
end
