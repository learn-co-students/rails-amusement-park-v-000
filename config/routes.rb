Rails.application.routes.draw do
  root 'static#home'
  resources :users
  get '/signin', to: 'sessions#new'
  delete '/logout', to: 'sessions#destroy'
  resources :sessions, only: [:create]
end
