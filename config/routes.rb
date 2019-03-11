Rails.application.routes.draw do
  resources :users, only: %i[show new create]
  resources :welcome, only: %i[home]
  resources :sessions, only: %i[signin create destroy]
  resources :attractions, except: [:destroy]
  resources :rides, only: [:create]

  root 'welcome#home'
  get '/signin', to: 'sessions#signin'
  get '/signout', to: 'sessions#destroy'
end
