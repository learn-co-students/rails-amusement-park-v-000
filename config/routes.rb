Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'application#home'
  get '/signin', to: 'sessions#new'
  resources :sessions, only: [:create]
  resources :users
end
