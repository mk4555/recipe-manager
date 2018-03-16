class Recipe < ActiveRecord::Base
  belongs_to :user

  validates :name, presence: true
  validates :rating , numericality: {greater_than: 0, less_than_or_equal_to: 5}
  validates :cook_time, numericality: {greater_than: 0}
  validates :description, presence: true
  
  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients

  accepts_nested_attributes_for :ingredients
  accepts_nested_attributes_for :recipe_ingredients

  scope :highest_rating, -> {order(rating: :desc)}
  scope :lowest_rating, -> {order(rating: :asc)}
end
