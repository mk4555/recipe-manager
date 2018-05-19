class DirectionsController < ApplicationController
  before_action :set_recipe
  def new
    @directions = 6.times.collect {@recipe.directions.build}
  end

  private

  def set_recipe
    @recipe = Recipe.find_by_id(params[:recipe_id])
  end
end
