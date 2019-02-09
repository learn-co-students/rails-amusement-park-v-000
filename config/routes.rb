Rails.application.routes.draw do
  
  resources :users
  resources :attractions

  get '/', to: 'application#home'
  post '/users/new', to: 'users#create'
  get '/signin', to: 'users#signin'
  post '/signin', to: 'sessions#signin'
  get '/logout', to: 'sessions#destroy'
  post '/attractions/new', to: 'attractions#create'

  post '/rides/new', to: 'rides#new'
end
