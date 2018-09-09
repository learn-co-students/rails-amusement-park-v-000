Rails.application.routes.draw do

  root "welcome#home"

  get 'signin' => 'sessions#new'
  post 'signin' => 'sessions#create'
  post 'logout' => 'sessions#destroy'

  resources :users
  resources :attractions

end
