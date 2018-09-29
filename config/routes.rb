Rails.application.routes.draw do

  root 'static#home'

  resources :users, only: [:new, :create, :show]
  resources :attractions, only: [:index, :new, :create, :show, :edit, :update]
  resources :rides, only: [:new, :create]

  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'

end
