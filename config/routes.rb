Rails.application.routes.draw do
  root 'application#home'

  resources :users
  resources :attractions

  get '/signup' =>'users#new'
  post '/signup' => 'users#create'

  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  get '/signout' => 'sessions#destroy'

  resources :rides, only: [:new, :create]
  post '/rides/new' => 'rides#create'

end
