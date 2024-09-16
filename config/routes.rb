Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'static#homepage'
  get '/signin', to: 'sessions#new'
  post '/sessions/create', to: 'sessions#create'
  delete '/sessions/delete', to: 'sessions#destroy'
  get '/sessions/delete', to: 'sessions#destroy'
  resources :rides
  resources :attractions
  resources :users
end
