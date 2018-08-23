Rails.application.routes.draw do
  get '/signin', to: "sessions#signin"

  resources :users, only: [:show, :new, :create]
  
  root "welcome#home"
end
