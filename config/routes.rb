Rails.application.routes.draw do
  root 'users#new'
  resources :rides
  resources :users
  get '/user/:id' => 'users#show'
  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
end
