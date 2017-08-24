class SkillSerializer < ApplicationSerializer
  attributes :id, :skill
  belongs_to :user
end
