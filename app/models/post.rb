class Post < ApplicationRecord
  belongs_to :user
  has_many :comments

  def job_posting
    []
  end

  def resume
    {}
  end

  def cover_letter
    {}
  end
end
