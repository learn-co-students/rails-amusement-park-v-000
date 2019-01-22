Rails.application.routes.draw do
  resources :users
  resources :rides
  resources :attractions

    get '/signin', to: 'sessions#new'
    post '/signin', to: 'sessions#create'
    get '/signout', to: 'sessions#destroy'

  root 'users#new'

end
