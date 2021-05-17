Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'static#home'
  resources :users, only: [:show, :new, :create]

  get '/signin' => 'users#signin'
  post '/signin' => 'users#create_signin'
  post '/logout' => 'users#destroy'

  resources :attractions, only: [:index, :show, :new, :create]
  resources :rides, only: [:new, :create]
end
