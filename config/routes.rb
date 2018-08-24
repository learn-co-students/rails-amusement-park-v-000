Rails.application.routes.draw do
  get '/signin', to: "sessions#signin"
  post '/authenticate', to: "sessions#authenticate" 

  resources :users, only: [:show, :new, :create]

  root "welcome#home"
end
