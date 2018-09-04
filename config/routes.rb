Rails.application.routes.draw do
  root 'welcome#home'
  resources :users
  resources :attractions
  resources :rides

  get '/signin', to: 'sessions#new'

  post '/signin', to: 'sessions#create'

  delete "/signout", to: "sessions#destroy"


end
