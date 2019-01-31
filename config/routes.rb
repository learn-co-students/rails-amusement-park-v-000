Rails.application.routes.draw do

  root 'users#welcome'

  get '/users/new', to: 'users#new', as: 'signup'
  post '/users', to: 'users#create'
  get '/users/:id', to: 'users#show', as: 'user'
  post '/users/:id', to: 'users#update', as: 'update_user'

  get '/sessions/new', to: 'sessions#new', as: 'login'
  post '/sessions', to: 'sessions#create'
  #post '/logout', to: 'sessions#destroy'
  get '/logout', to: 'sessions#destroy'
  get '/signin', to: 'sessions#new'

  resources :attractions, except: :destroy 
end
