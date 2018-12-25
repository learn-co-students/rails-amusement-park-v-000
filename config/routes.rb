Rails.application.routes.draw do
  root 'application#home'
  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'
  post '/logout', to: 'sessions#destroy', as: 'destroy_session'

  get 'users/new' => 'users#new'
  post 'users/new' => 'users#create'
  resources :users, except: [:new]
end
