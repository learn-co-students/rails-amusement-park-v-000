Rails.application.routes.draw do
  root 'application#home'
  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  resources :users

  resources :attractions
  post 'attractions/:id' => 'attractions#take_ride', as: :take_ride

  namespace :admin do
    resources :attractions, only: [:index]
  end
end
