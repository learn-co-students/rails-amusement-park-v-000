Rails.application.routes.draw do
  root to: 'users#new'

  get '/signin', to: 'sessions#new', as: 'session_path'
  resource  :sessions, except: [:new]
  resources :users
end
