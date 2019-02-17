Rails.application.routes.draw do

  get '/signin' => 'sessions#new'

  post '/signin' => 'sessions#create'

  get '/signout' => 'sessions#destroy'


  resources :users, only: [:new, :create, :show]
  resources :attractions, only: [:new, :create, :show, :index, :edit, :update]
  resources :rides, only: [:new, :create, :show, :index]

  root 'users#index'
  #post '/rides/create', to:'rides#create'
end
