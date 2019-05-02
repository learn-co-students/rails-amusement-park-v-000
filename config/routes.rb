Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'users#home'
  resources :users
  get    '/login',   to: 'sessions#new'
  post   '/login',    to: 'sessions#create'
  get    '/signup',   to: 'users#new'
  post   '/signup',    to: 'users#create'
  delete '/signout',  to: 'sessions#destroy'
end
