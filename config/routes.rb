Rails.application.routes.draw do
  root to: 'application#home'

  get '/signin', to: 'sessions#sign_in', as: 'signin'
  post '/signin', to: 'sessions#create'

  get '/logout', to: 'sessions#destroy'

  post 'rides/create', to: 'rides#create'

  resources :attractions
  resources :users
end
