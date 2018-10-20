Rails.application.routes.draw do
  root 'users#welcome'
  resources :rides
  resources :users
  get '/user/:id' => 'users#show'
  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'
end
