json.extract! post, :id, :user_id, :text, :likes, :link, :created_at, :updated_at
json.url post_url(post, format: :json)
