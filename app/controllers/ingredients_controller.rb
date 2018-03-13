class IngredientsController < ApplicationController
  def index
    @ingredients = Ingredient.all
  end

  def new
    @ingredient = Ingredient.new
  end

  def create
    ingredient = Ingredient.create(ingredient_params)
    if ingredient
      redirect_to ingredient_path(ingredient)
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
    params.require(:ingredient).permit(:name)
  end
end
