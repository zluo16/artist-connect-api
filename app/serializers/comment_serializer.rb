class CommentSerializer < ApplicationSerializer
  attributes :id, :text
  belongs_to :post
  has_one :user
end
