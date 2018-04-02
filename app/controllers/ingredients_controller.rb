class IngredientsController < ApplicationController
  def index
    @ingredients = Ingredient.all
  end

  def show
    @ingredient = Ingredient.find_by_id(params[:id])
  end

  def new
    @ingredient = Ingredient.new
  end

  def create
    @ingredient = Ingredient.find_or_create_by(ingredient_params)
    if @ingredient.save
      redirect_to ingredient_path(@ingredient)
    else
      render 'new'
    end
  end

  private

  def ingredient_params
    params.require(:ingredient).permit(:name)
  end
end
