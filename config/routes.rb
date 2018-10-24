Rails.application.routes.draw do

  resources :users
  root 'users#show'

  get 'signin' => 'sessions#new'
  post 'sessions/create', to: 'sessions#create'
end
