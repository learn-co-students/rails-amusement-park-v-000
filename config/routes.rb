Rails.application.routes.draw do

  root 'application#welcome'

  resources :users, :only => [:new, :create, :show]
  resources :attractions
  resources :rides, :only => [:create]

  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  get '/logout' => 'sessions#destory'

end
