Rails.application.routes.draw do
  resources :users
  root 'users#new'
   get 'signin' => 'sessions#new'
end
