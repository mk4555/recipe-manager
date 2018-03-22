class IngredientsController < ApplicationController
  def index
    @ingredients = Ingredient.all
  end

  def new
    @ingredient = Ingredient.new
  end

  def create
    # would validating uniqueness in the model help clean this up?
    @ingredient = Ingredient.create(ingredient_params)
    if @ingredient.save
      redirect_to ingredient_path(@ingredient)
    else
      render 'new'
    end
  end

  def show
    @ingredient = Ingredient.find_by_id(params[:id])
  end

  private

  # need to add recipe id as a parameter
  def ingredient_params
    params.require(:ingredient).permit(:name, recipe_ingredient: [:quantity])
  end
end
