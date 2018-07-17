Rails.application.routes.draw do
  root 'welcome#home'
  resources :attractions
  resources :users
  resources :rides
end
