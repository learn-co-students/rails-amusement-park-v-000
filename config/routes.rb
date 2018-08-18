Rails.application.routes.draw do

  root 'application#main'

  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'

  resources :users
  resources :attractions

end
