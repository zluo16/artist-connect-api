class EducationSerializer < ApplicationSerializer
  attributes :id, :school_name, :education_level, :year_started, :year_completed, :gpa
  belongs_to :user
end
