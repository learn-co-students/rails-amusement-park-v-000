Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'application#home'
  get '/signin', to: 'sessions#new'
  get '/logout', to: 'sessions#destory'
  resources :sessions, only: [:create]
  resources :users
  resources :attractions
  post 'rides/ride', as: :ride  
end
