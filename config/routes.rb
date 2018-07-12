Rails.application.routes.draw do

  resources :users
  resources :rides
  resources :attractions

  root "welcome#home"
end
