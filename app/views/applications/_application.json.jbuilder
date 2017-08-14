json.extract! application, :id, :user_id, :job_posting_id, :resume, :cover_letter, :created_at, :updated_at
json.url application_url(application, format: :json)
