Rails.application.routes.draw do
  root 'users#new'
  resources :rides
  resources :users

end
