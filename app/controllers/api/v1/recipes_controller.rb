class Api::V1::RecipesController < ApplicationController
  def index
    @ingredients = RecipeFacade.ingredients

    # conn = Faraday.new(url: "https://api.edamam.com") do |faraday|
    #   faraday.params['app_id'] =  ENV['edamam_app_id']
    #   faraday.params['app_key'] =  ENV['edamam_app_key']
    # end

    # response = conn.get("/api/recipes/v2?type=public&beta=true&q=avocado&")
    # #q will be params[:q] from search view
    # data = JSON.parse(response.body, symbolize_names: :true)
    # recipe_results = data[:hits]

    # recipe_results.each do |recipe|
    #   ingredients_list = recipe[:recipe][:ingredients]
    #   ingredients_array = ingredients_list.map do |i|
    #     i[:food]
    #   end
    #   ingredients_string = ingredients_array.join ", "
    #   Recipe.create!(ingredients: ingredients_string, label: recipe[:recipe][:label], uri: recipe[:recipe][:uri])
    # end

    render json: RecipeSerializer.new(Recipe.all)
  end
end
