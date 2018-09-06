Rails.application.routes.draw do

  root "application#welcome"
  resources :users
  resources :rides
  resources :attractions

  get '/signin' => "users#login"
  get '/logout' => "users#logout"
  # post '/take_ride' => "attractions#ride", :as => :take_ride
end
