class RecipesSerializer < ActiveModel::Serializer
  attributes :id, :name, :rating, :cook_time, :description, :user_id
end
