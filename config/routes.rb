Rails.application.routes.draw do

  root 'sessions#new'
  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
  resources :users, only: [:new, :create, :show, :edit]
  resources :attractions, only: [:index, :new, :create, :show, :edit, :update]

  post '/attractions/:id/ride' => 'attractions#ride', as: 'ride_attraction'

end
