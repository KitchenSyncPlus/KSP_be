class Api::V1::GroupsController < ApplicationController
  def index
    render json: GroupSerializer.new(Group.all)
  end

  def show
    render json: GroupSerializer.new(Group.find(request.params[:id]))
  end

  def create
  end
end
