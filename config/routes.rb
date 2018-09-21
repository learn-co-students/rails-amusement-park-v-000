Rails.application.routes.draw do
  root 'sessions#home'

  resources :users

  resources :attractions

  resources :rides

  get '/signup' => 'users#new'
  post '/users/create' => 'users#create'

  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'

  get '/logout' => 'sessions#destroy'

end
