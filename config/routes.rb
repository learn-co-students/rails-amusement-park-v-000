Rails.application.routes.draw do
  get '/signin', to: "sessions#signin"
  post '/authenticate', to: "sessions#authenticate"
  delete '/session', to: "sessions#signout"

  resources :users, only: [:show, :new, :create]
  resources :attractions, only: [:index, :show, :new]
  resources :rides, only: [:create]

  root "welcome#home"
end
