Rails.application.routes.draw do
  root 'users#new'
  resources :users, :attractions
  post '/attractions/:id' => 'users#update'

  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  get '/logout' => 'sessions#destroy'


end
