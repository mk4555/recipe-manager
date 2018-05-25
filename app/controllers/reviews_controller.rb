class ReviewsController < ApplicationController
  before_action :set_recipe
  def show
  end

  def new

  end

  def create
  end

  private

  def set_recipe
    @recipe = Recipe.find_by_id(params[:recipe_id])
  end
end
