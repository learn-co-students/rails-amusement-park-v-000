Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'users#home'
  resources :users
  resources :rides
  resources :attractions
  get    '/signin',   to: 'sessions#new'
  post   '/signin',    to: 'sessions#create'
  get '/logout',  to: 'sessions#destroy'
end
