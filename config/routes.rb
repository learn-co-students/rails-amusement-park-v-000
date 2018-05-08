Rails.application.routes.draw do
  root 'statis_pages#home'
  get '/signin', to: 'sessions#new'
  resources :attractions
  resources :users
end
