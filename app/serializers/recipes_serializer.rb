class RecipesSerializer < ActiveModel::Serializer
  attributes :id, :name, :rating, :cook_time, :description, :user_id
  belongs_to :user
  has_many :ingredients, :directions
end
