Rails.application.routes.draw do
  get '/signin', to: "sessions#signin"
  post '/authenticate', to: "sessions#authenticate"
  delete '/session', to: "sessions#signout"

  resources :users, only: [:show, :new, :create]

  root "welcome#home"
end
