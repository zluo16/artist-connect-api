class ExperienceSerializer < ApplicationSerializer
  attributes :id, :company_name, :title, :start_year, :end_year
  belongs_to :user
end
