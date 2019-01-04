Rails.application.routes.draw do

  resources :users

  resources :attractions

  resources :rides, only: [:new, :create]

  root 'application#home'

  get '/signin', to: 'sessions#new'

  post '/signin', to: 'sessions#create'

  get '/signout', to: 'sessions#destroy', via: 'delete'

end
