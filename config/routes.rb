Rails.application.routes.draw do
  root 'welcome#home'
  resources :rides
  resources :users
  resources :attractions
end
