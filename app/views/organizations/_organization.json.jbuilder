json.extract! organization, :id, :name, :organization_type, :email, :password_digest, :created_at, :updated_at
json.url organization_url(organization, format: :json)
