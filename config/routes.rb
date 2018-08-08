Rails.application.routes.draw do
  resources :users
  resources :attractions
  resources :rides

  namespace :admin do
    resources :attractions, only [:new]
  end


end
