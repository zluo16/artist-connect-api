Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      post '/login', to: 'auth#create'
      get '/me', to: 'auth#show'

      resources :educations
      resources :locations
      resources :ownerships
      resources :organization_connections
      resources :user_connections
      resources :job_postings
      resources :organizations
      resources :users
      resources :skills
      resources :experiences
      resources :tags
      resources :applications
    end
  end
end
