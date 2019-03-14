Rails.application.routes.draw do
 
  root 'application#index' 
  resources :rides
  resources :attractions
  resources :users
end
