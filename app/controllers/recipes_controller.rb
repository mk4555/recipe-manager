class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
  end

  def create
    recipe = Recipe.create(recipe_params)
    if recipe
      redirect_to recipe_path(recipe)
    else
      redner 'new'
    end
  end

  def show
    @recipe = Recipe.find_by(params[:id])
  end

  private
  # need to add ingredients id as a parameter
  def recipe_params
    params.require(:recipe).permit(:name, :rating, :description, :cook_time, :user_id)
  end
end
