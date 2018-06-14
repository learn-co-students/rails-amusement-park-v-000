Rails.application.routes.draw do
  resources :users, only: [:show, :new, :create]
  resources :attractions


  get "/signin", to: "sessions#signin", as: "signin"
  post '/signin', to: 'sessions#confirm_signin', as: "confirm_signin"
  get '/signout', to: 'sessions#signout', as: "signout"

  post '/take_ride/:attraction_id', to: 'attractions#take_ride', as: 'take_ride'

  get "/", to: "users#index", as: "root_url" 
  
end
