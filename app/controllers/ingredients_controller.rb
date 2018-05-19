class IngredientsController < ApplicationController
  before_action :set_ingredient, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  def index
    @ingredients = Ingredient.all
    render :json => @ingredients
  end

  def show
  end

  def new
    @ingredient = Ingredient.new
  end

  def create
    @ingredient = Ingredient.find_or_create_by(ingredient_params)
    @ingredient.name = @ingredient.name.downcase
    if @ingredient.save
      redirect_to ingredient_path(@ingredient)
    else
      render 'new'
    end
  end

  def edit
    if !current_user.admin?
      redirect_to ingredients_path
    end
  end

  def update
    if @ingredient.update(ingredient_params)
      redirect_to ingredient_path(@ingredient)
    else
      render 'edit'
    end
  end

  def destroy
    @ingredient.recipe_ingredients.size.times do
      recipe = RecipeIngredient.find_by(ingredient_id: @ingredient.id)
      recipe.delete
    end
    @ingredient.destroy
    redirect_to ingredients_path
  end

  private

  def ingredient_params
    params.require(:ingredient).permit(:name)
  end

  def set_ingredient
    @ingredient = Ingredient.find_by_id(params[:id])
  end

end
