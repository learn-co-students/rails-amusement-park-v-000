  Rails.application.routes.draw do

    root "static#home"

    resources :users
    resources :attractions
    resources :rides


    get '/signin', to: 'sessions#sign_in'
    post '/signin', to: 'sessions#create'

    get '/logout', to: 'sessions#destroy'
    post '/logout', to: 'sessions#destroy'


  end
