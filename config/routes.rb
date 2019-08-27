Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  post 'logout' => 'sessions#destroy'
  get 'signup' => 'users#new'
  get 'signin' => 'users#create'
  root 'application#hello'
  resources :users
  # resources :attractions
end
