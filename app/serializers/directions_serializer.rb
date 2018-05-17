class DirectionsSerializer < ActiveModel::Serializer
  attributes :id, :direction
  belongs_to :recipes
end
