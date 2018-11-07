Rails.application.routes.draw do

  resources :attractions
  resources :users
  root 'welcome#home'
  get "/signin", to: "sessions#new"
  post "/signin", to: "sessions#create"
  delete "/signout", to: "sessions#destroy"
  get "/rides/new", to: "rides#new"
end
