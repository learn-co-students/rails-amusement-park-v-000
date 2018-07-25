Rails.application.routes.draw do
  resources :users
  get "/signin" => 'sessions#signin'
  post "/session" => 'sessions#create'
  get "/signout" => 'sessions#destroy'
  root 'application#hello'
  get "/attractions" => 'attractions#index'
  get "/attractions/:id" => 'attractions#show'

  post "/rides" => 'rides#create'
end
