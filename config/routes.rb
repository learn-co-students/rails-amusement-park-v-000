Rails.application.routes.draw do
  root 'application#home'

  get 'signin' => 'sessions#new'
  post 'signin' => 'sessions#create'
  post 'signout' => 'sessions#destroy'

  post 'rides' => 'rides#create'

  resources :users
  resources :attractions
end
