Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  post 'logout' => 'sessions#destroy'
  get 'signup' => 'users#new'
  get 'signin' => 'sessions#new'
  post 'signin' => 'sessions#create'
  root 'application#hello'
  resources :users
  resources :rides
  resources :attractions
  
end
