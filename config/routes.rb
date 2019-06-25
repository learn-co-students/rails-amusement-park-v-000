Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'application#welcome'
  resources :attractions do
    resources :rides, only: [:show, :create, :index]
  end

  resources :users do
    resources :rides, only: [:show, :index, :create]
  end

  resources :rides, only: [:new, :create]

  get '/signin', to: 'sessions#new', as: 'signin'
  post '/signin', to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy', as: 'logout'
end
