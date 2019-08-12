  Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'users#index'

  resources :users

  get 'signin' => 'sessions#new'
  post 'sessions' => 'sessions#create'
  get 'session' => 'sessions#destroy'

  resources :attractions
  resources :rides

end
