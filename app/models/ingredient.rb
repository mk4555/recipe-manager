class Ingredient < ActiveRecord::Base
  validates :name, presence: true

  has_many :recipe_ingredients
  has_many :recipes, through: :recipe_ingredients
  before_save :downcase_name

  def downcase_name
    self.name = self.name.downcase
  end

  def capitalized_name
    self.name.capitalize
  end
end
