class Api::V1::RecipesController < ApplicationController
  def index
    conn = Faraday.new(url: "https://api.edamam.com")

    response = conn.get("/api/recipes/v2?type=public&beta=true&q=avocado&app_id=fc8a5789&app_key=3877bb1c95fcce6327d26aa97e4edf16")
    render json: RecipeSerializer.new(Recipe.all)
  end
end