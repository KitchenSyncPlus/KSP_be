class Api::V1::GroupRecipesController < ApplicationController
  def index
    render json: RecipeSerializer.new(Group.find(params[:id]).recipes)
  end
end