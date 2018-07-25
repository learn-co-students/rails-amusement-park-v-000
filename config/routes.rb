Rails.application.routes.draw do
resources :users
resources :attractions
resources :sessions
root "sessions#index"
get "/signin" => "sessions#new"
post "/signin" => "sessions#create"
get "/logout" => "sessions#destroy"


end
