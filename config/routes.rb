Rails.application.routes.draw do
  resources :users
  resources :attractions
  resources :rides

  root 'users#new'

  get 'signin' => 'sessions#new'
  post 'signin' => 'sessions#create'
  post 'signout' => 'sessions#destroy'

end
