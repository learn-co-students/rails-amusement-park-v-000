Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  root to: 'sessions#home'
  get "/signin", to: "sessions#new"
  post "/signin", to: "sessions#create"
  get "/logout", to: "sessions#destroy"
  delete "/logout", to: "sessions#destroy"
  resources :users, only: [:new, :create, :show]
  resources :attractions, only: [:index, :show, :new, :create]
  resources :rides, only: [:create]
end
