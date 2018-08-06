Rails.application.routes.draw do
  root 'sessions#home'

  resources :users

  get '/users/new' => 'users#new', :as => '/signup'
  post '/users/create' => 'users#create'

  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'


end
