Rails.application.routes.draw do
  root "welcome#index"

  resources :users
  resources :attractions

  get '/login', to: "sessions#new"

  get '/logout', to: "sessions#delete"

end
