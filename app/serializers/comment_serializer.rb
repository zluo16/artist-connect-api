class CommentSerializer < ApplicationSerializer
  attributes :id, :text
  belongs_to :post
  belongs_to :user
end
