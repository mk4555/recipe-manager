class RecipesController < ApplicationController
  def index
    if params[:user_id]
      @recipes = current_user.recipes.all
    else
      @recipes = Recipe.all
    end
  end

  def new
    @recipe = Recipe.new
    ingredients = @recipe.ingredients.build
    ingredients.recipe_ingredients.build
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

  def edit
    @recipe = Recipe.new
  end

  def update
    @recipe = Recipe.update(recipe_params)
    if @recipe.save
      # have flash message indicating it was updated successfully
      redirect_to recipe_path(@recipe)
    else
      render 'edit'
    end
  end

  def destroy
    @recipe = Recipe.find_by_id(params[:id])
    @recipe.destroy
    redirect_to recipes_path
  end

  private
  # need to add ingredients id as a parameter
  def recipe_params
    params.require(:recipe).permit(:name, :rating, :description, :cook_time, :user_id, ingredient_ids: [], :ingredient_attributes => [:name])
  end
end
