class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user

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
