Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'application#home'
  # get 'users_controller/new'
  # get '/session', to: 'users#delete'
  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'
  resources :attractions
  resources :users
  resources :sessions, only: %i[new create destroy]
  delete '/session', to: 'sessions#destroy'
end
