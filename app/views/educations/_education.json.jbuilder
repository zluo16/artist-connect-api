json.extract! education, :id, :school_name, :education_level, :year_started, :year_completed, :gpa, :created_at, :updated_at
json.url education_url(education, format: :json)
