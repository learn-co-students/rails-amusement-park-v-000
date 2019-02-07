Rails.application.routes.draw do
  root "welcome#home"
  resources :users
  resources :rides, only: [:new, :create]
  resources :attractions
  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
  post '/logout' => 'sessions#destroy'
end
