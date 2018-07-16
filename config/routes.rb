Rails.application.routes.draw do
  resources :users
  get "/signin" => 'sessions#signin'
  root 'application#hello'
end
