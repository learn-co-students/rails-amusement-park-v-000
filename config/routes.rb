Rails.application.routes.draw do
  get '/signin', to: "sessions#sign_in", as: "signin"
  post '/signin', to: "sessions#log_in"
  delete '/signout', to: "sessions#sign_out", as: "signout"
  root to: "welcome#home"
  resources :users
  resources :attractions
  post '/ride', to: 'rides#ride', as: "ride"
end
