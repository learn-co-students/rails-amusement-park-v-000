Rails.application.routes.draw do
  root 'welcome#welcome'
  resources :attractions
  resources :users
  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  post '/rides/new', to: 'rides#create'
  resources :rides

end
