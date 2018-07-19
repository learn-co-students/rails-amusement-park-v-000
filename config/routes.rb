Rails.application.routes.draw do
  resources :users
  get "/signin" => 'sessions#signin'
  post "/session" => 'sessions#create'
  root 'application#hello'
end
