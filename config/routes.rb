Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "sessions#index"
  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'
  resources :sessions, only: [:index, :show, :destroy ]
  resources :users, only: [:new, :create, :show, :edit, :update, :destroy]
  resources :attractions, only: [:index, :new, :create, :show, :edit, :update, :destroy]
  resources :rides, only: [:new, :create]

end
