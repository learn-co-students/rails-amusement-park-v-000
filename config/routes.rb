Rails.application.routes.draw do
  resources :users
  resources :attractions
  root 'users#new'
  post '/users/:id', to: 'users#show'
  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'
  get '/logout' => 'sessions#destroy'
end
