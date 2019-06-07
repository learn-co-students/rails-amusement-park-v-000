Rails.application.routes.draw do
  get 'rides/create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'application#home'
  resources :users
  resources :rides
  resources :attractions

  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  post '/logout' => 'sessions#destroy'
end
