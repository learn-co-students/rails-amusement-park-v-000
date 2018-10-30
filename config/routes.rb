Rails.application.routes.draw do
  
  root "application#home"
  resources :users 
  resources :attractions
  resources :sessions 
  resources :rides 
  
  
    get "signin", to: "sessions#new"
    post "signin", to: "sessions#create"
    delete "signout", to: "sessions#destroy" 
  
end
