Rails.application.routes.draw do

  resources :users
  resources :sessions
  resources :attractions
  resources :rides

  root "application#welcome"

  get "/sign_up" => "users#new"
  # get "/signin" => 

  devise_for :users, path: '',
    :path_names => { sign_in: 'signin', sign_up: 'users/new', sign_out: 'logout'},
    :controllers => {:sessions => "sessions"}
end
