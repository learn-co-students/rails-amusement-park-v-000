Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'users#home'
  resources :users
  get    '/signin',   to: 'sessions#new'
  post   '/signin',    to: 'sessions#create'
  # get    '/signin',   to: 'users#new'
  # post   '/signin',    to: 'users#create'
  delete '/signout',  to: 'sessions#destroy'
end
