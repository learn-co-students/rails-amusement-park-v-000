Rails.application.routes.draw do
  root to: 'users#new'

  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'
  match '/logout', to:'sessions#destroy', via: [:get, :delete]

  resource  :sessions, except: [:new]
  resources :users
  resources :attractions
  resources :rides
end
