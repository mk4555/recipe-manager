class ReviewSerializer < ActiveModel::Serializer
  attributes :id, :body
  belongs_to :recipe
  belongs_to :user
end
