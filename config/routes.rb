Rails.application.routes.draw do

  resources :users
  resources :attractions

  get '/signin', to: 'sessions#new'
  post '/signup', to: 'sessions#create'
  
end
