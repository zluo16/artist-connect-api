json.extract! user, :id, :first_name, :last_name, :stage_name, :email, :dob, :created_at, :updated_at
json.url user_url(user, format: :json)
