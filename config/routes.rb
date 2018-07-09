  Rails.application.routes.draw do

    root "static#home"

    resources :users
    resources :attractions


    get '/signin', to: 'sessions#sign_in'
    post '/signin', to: 'sessions#create'

    get '/logout', to: 'sessions#destroy'
    post '/rides/new', to: 'rides#new'

  end
