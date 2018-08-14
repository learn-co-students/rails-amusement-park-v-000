Rails.application.routes.draw do
  Rails.application.routes.draw do
  root 'users#index'
  resources :users
  resources :sessions
  resources :attractions

  get '/signin', to: 'sessions#new'
  get '/logout', to: 'sessions#destroy'
  post '/update', to: 'users#update', as: 'update_user'
  post '/rides', to: 'rides#create'

end

end
