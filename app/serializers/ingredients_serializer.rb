class IngredientsSerializer < ActiveModel::Serializer
  attributes :id, :name
  belongs_to :recipes
end
