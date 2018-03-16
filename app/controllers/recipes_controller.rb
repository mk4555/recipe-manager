class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
    @ingredients = 6.times.collect { @recipe.recipe_ingredients.build }
  end

  def create
    @recipe = Recipe.create(recipe_params)
    if @recipe.save
      redirect_to recipe_path(@recipe)
    else
      render 'new'
    end
  end

  def show
    @recipe = Recipe.find_by_id(params[:id])
  end

  private
  # need to add ingredients id as a parameter
  def recipe_params
    params.require(:recipe).permit(:name, :rating, :description, :cook_time, :user_id)
  end
end
