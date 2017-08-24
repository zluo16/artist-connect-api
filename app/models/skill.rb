class Skill < ApplicationRecord
  belongs_to :user

  def resume
    ''
  end

  def cover_letter
    ''
  end
end
