json.extract! location, :id, :address, :city, :state, :suite, :zipcode, :main, :created_at, :updated_at
json.url location_url(location, format: :json)
