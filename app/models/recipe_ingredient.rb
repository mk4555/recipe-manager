class RecipeIngredient < ActiveRecord::Base
  belongs_to :recipe
  belongs_to :ingredient
  validates :quantity, presence: true
  def capitalized_ingredient
    ingredient.name.capitalize
  end
end
