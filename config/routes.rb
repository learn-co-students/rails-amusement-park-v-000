Rails.application.routes.draw do
  root :to => 'welcome#index'
  get "/signin", to: "sessions#new"
   post "/sessions/create", to: "sessions#create"
   get "/signout", to: "sessions#destroy"


   resources :attractions
   post "/rides/new", to: "rides#ride"

   resources :users

end