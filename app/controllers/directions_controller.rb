class DirectionsController < ApplicationController
  before_action :set_recipe
  
  private

  def set_recipe
    @recipe = Recipe.find_by_id(params[:recipe_id])
  end
end
