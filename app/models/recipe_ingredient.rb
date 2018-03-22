class RecipeIngredient < ActiveRecord::Base
  belongs_to :recipe
  belongs_to :ingredient

  validates :quantity, presence: true

  accepts_nested_attributes_for :ingredient, reject_if: proc {|attributes| attributes['name'].blank?}
end
