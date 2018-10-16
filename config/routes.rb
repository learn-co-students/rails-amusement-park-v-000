Rails.application.routes.draw do
  resources :users
  resources :rides
  resources :attractions

   root 'static#home'
end
