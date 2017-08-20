class PostSerializer < ApplicationSerializer
  attributes :id, :text, :likes, :link, :job_posting
  has_one :user
  has_many :comments
end
