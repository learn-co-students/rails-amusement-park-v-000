Rails.application.routes.draw do
  resources :rides
  resources :users
  resources :attractions
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
