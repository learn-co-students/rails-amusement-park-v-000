Rails.application.routes.draw do
  root "static#home"
  resources :attractions
  resources :users
end
