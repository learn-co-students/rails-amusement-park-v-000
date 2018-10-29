Rails.application.routes.draw do
  resources :users
  resources :sessions
  root 'users#new'
   get 'signin' => 'sessions#new'
end
