Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


   get '/signin' => 'sessions#new', as: 'signin'
   post '/session', to: 'sessions#create', as: 'session'
   get '/users/:id', to: 'users#show', as: 'user'

  resources :users, only: [:new, :create]

  root 'users#index'

end
