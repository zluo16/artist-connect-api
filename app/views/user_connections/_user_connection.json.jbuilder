json.extract! user_connection, :id, :user_id, :connectee_id, :created_at, :updated_at
json.url user_connection_url(user_connection, format: :json)
