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
    @ingredients = 5.times.collect {@recipe.recipe_ingredients.build}
  end

  def create
    @recipe = Recipe.create(recipe_params)
    if @recipe.save
      @recipe.add_ingredients(recipe_ingredients_params)
      redirect_to recipe_path(@recipe)
    else
      render 'new'
    end
  end

  def show
    set_recipe
  end

  def edit
    set_recipe
    @ingredients = @recipe.recipe_ingredients

    if current_user.id != @recipe.user.id
      #need to flash error message
      redirect_to root_path
    end
  end

  def update
    set_recipe
    if @recipe.update(recipe_params)
      @recipe.add_ingredients(recipe_ingredients_params)
      # have flash message indicating it was updated successfully
      redirect_to recipe_path(@recipe)
    else
      render 'edit'
    end
  end

  def destroy
    @recipe = Recipe.find_by_id(params[:id])
    @recipe.destroy
    redirect_to user_recipes_path(current_user)
  end

  private
  # need to add ingredients id as a parameter

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
