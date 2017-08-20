Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      post '/login', to: 'auth#create'
      get '/me', to: 'auth#show'
      get '/posts/:id/comments', to: 'posts#comments'
      # get 'comments_controller/index'
      # get 'comments_controller/show'
      # get 'comments_controller/create'
      # get 'comments_controller/destroy'

      resources :posts
      resources :educations
      resources :locations
      resources :comments
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
