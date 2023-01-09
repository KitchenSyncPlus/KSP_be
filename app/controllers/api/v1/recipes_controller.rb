class Api::V1::RecipesController < ApplicationController
  def index
    render json: EdamamFacade.recipe_search(params[:q])
  end

  def show
    render json: EdamamFacade.recipe_show(params[:ext_id])
  end
  
  def ingredients
    render json: EdamamFacade.recipe_ingredients(params[:ext_id])
  end
end
