class CommentsSerializer < ActiveModel::Serializer
  attributes :id
  belongs_to :recipes
  belongs_to :users
end
