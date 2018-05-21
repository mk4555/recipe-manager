class DirectionSerializer < ActiveModel::Serializer
  attributes :id, :direction

  belongs_to :recipe
end
