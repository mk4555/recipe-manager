class Recipe < ActiveRecord::Base
  belongs_to :user
  
  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients

  scope :highest_rating, -> {order(rating: :desc)}
  scope :lowest_rating, -> {order(rating: :asc)}
end
