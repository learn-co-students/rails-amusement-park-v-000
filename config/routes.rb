Rails.application.routes.draw do
  
  root "application#home"
  resources :users 
  resources :attractions
  resources :sessions 
  resources :rides 
end
