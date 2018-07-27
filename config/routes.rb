Rails.application.routes.draw do
  resources :users
  resources :attractions
  root 'users#new'
  get '/signin', to: 'users#signin'
  post '/signin', to: 'sessions#create'
  get '/logout', to: 'users#signout'
end
