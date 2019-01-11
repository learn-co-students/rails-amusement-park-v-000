Rails.application.routes.draw do

    root "users#home"

    resources :users 
    resources :attractions
    resources :rides
    resources :sessions

    get '/signin', to: 'sessions#new' 
  
end
