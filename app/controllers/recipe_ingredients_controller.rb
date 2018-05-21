class RecipeIngredientsController < ApplicationController
  before_action :set_recipe

  def new
    @ingredient = @recipe.recipe_ingredients.build
  end

  def create
    @ingredient = RecipeIngredient.create(recipe_ingredients_params)
    i = Ingredient.find_or_create_by(name: params[:recipe_ingredient][:ingredient][:name])
    @ingredient.ingredient_id = i.id
    binding.pry
    if @ingredient.save
      redirect_to recipe_path(@recipe)
    else
      render 'new', locals: {recipe: @recipe, ingredient: @ingredient}
    end
  end

  private

  def recipe_ingredients_params
    params.require(:recipe_ingredient).permit(:quantity, :recipe_id)
  end

  def set_recipe
    @recipe = Recipe.find_by_id(params[:recipe_id])
  end
end
