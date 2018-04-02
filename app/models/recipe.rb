class Recipe < ActiveRecord::Base
  belongs_to :user

  validates :name, presence: true
  validates :rating , numericality: {greater_than: 0, less_than_or_equal_to: 5}
  validates :cook_time, numericality: {greater_than: 0}
  validates :description, presence: true

  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients

  accepts_nested_attributes_for :recipe_ingredients, reject_if: lambda {|attributes| attributes['name'].blank?}

  scope :highest_rating, -> {order(rating: :desc)}
  scope :lowest_rating, -> {order(rating: :asc)}

  def downcase_name
    self.name = self.name.downcase
  end

  def capitalized_name
    self.name.capitalize
  end
  
  def clear_ingredients
    if self.ingredients.size > 0
      self.ingredients.size.times do
        ingredient = RecipeIngredient.find_by(recipe_id: self.id)
        ingredient.delete
      end
      self.save
    end
  end

  def add_ingredients(params)
    clear_ingredients
    params[:recipe_ingredients_attributes].values.each do |ri|
      if ri[:quantity].present?
        if ri[:ingredient][:name].present?
          ingredient = Ingredient.find_or_create_by(name: ri[:ingredient][:name])
          RecipeIngredient.create(quantity: ri[:quantity], ingredient_id: ingredient.id, recipe_id: self.id)
        elsif ri[:ingredient_id].present?
          ingredient = Ingredient.find_by(id: ri[:ingredient_id])
          RecipeIngredient.create(quantity: ri[:quantity], ingredient_id: ingredient.id, recipe_id: self.id)
        end
      end
    end
    self.save
  end

end
