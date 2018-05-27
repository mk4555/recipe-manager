class RecipeSerializer < ActiveModel::Serializer
  attributes :id, :name, :rating, :cook_time, :description

  belongs_to :user

  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients

  has_many :directions
  has_many :reviews
end
