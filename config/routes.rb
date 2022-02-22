Rails.application.routes.draw do
  resources :users, only: [:new, :create, :show]
  root 'users#new'

  resources :attractions
  resources :rides

  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'
  get '/signout', to: 'sessions#destroy', via: 'delete'

end
