Rails.application.routes.draw do
  get 'signup' => 'users#new'
  post 'signup' => 'users#create'
  get 'signin'=> 'sessions#login'
  post 'signin' => 'sessions#create'
  delete 'logout' => 'sessions#logout'
  root 'welcome#index'

  resources :users, only: [:new, :create, :show]
  resources :attractions, except: [:destroy]
  resources :rides, only: [:create]
end
