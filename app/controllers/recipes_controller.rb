class RecipesController < ApplicationController
  before_action :set_recipe, only: [:show, :edit, :update, :destroy]

  def index
    if params[:user_id]
      @recipes = User.find_by_id(params[:user_id]).recipes.all
    elsif !params[:rating].blank?
      if params[:rating] == "Highest Rating"
        @recipes = Recipe.highest_rating
      elsif params[:rating] == "Lowest Rating"
        @recipes = Recipe.lowest_rating
      end
    else
      @recipes = Recipe.all
    end
  end

  def new
    @recipe = Recipe.new
    @ingredients = 5.times.collect {@recipe.recipe_ingredients.build}
  end

  def create
    @recipe = Recipe.create(recipe_params)
    @recipe.name = @recipe.name.downcase
    if @recipe.save
      @recipe.add_ingredients(recipe_ingredients_params)
      redirect_to recipe_path(@recipe)
    else
      render 'new', locals: {ingredients: 5.times.collect{@recipe.recipe_ingredients.build}}
    end
  end

  def show
    if (@recipe == nil)
      redirect_to root_path
    end
  end

  def edit
    @ingredients = @recipe.recipe_ingredients
    5.times.collect {@recipe.recipe_ingredients.build}

    if current_user.id != @recipe.user.id
      redirect_to root_path
    end
  end

  def update
    if @recipe.update(recipe_params)
      @recipe.add_ingredients(recipe_ingredients_params)
      redirect_to recipe_path(@recipe)
    else
      render 'edit', locals: {ingredients: 5.times.collect{@recipe.recipe_ingredients.build}}
    end
  end

  def destroy
    @recipe.destroy
    redirect_to user_recipes_path(current_user)
  end

  private

  def set_recipe
    @recipe = Recipe.find_by_id(params[:id])
  end

  def recipe_params
    params.require(:recipe).permit(:name, :rating, :description, :cook_time, :user_id)
  end

  def recipe_ingredients_params
    params.require(:recipe).permit(recipe_ingredients_attributes: [:quantity, :ingredient_id, ingredient: [:name]])
  end

end
