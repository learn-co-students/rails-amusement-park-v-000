Rails.application.routes.draw do
  
  get '/', to: 'users#welcome', as: 'root'
  
  get '/users/new', to: 'users#new', as: 'signup'
  post '/users/:id', to: 'users#take_ride', as: 'user_take_ride'
  resources :users, only: [:create, :show]

  get '/signin', to: 'sessions#new'
  post '/sessions', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy', as: 'logout'

  resources :attractions
  
end
