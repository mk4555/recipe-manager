class RecipeSerializer < ActiveModel::Serializer
  attributes :id, :name, :rating, :cook_time, :description, :user_id

  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients
end
