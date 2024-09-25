Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'sessions#home'

  #signup
  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'

  #login

  #logout
  delete '/logout' => 'sessions#destroy'
  
  resources :sessions
  resources :users, only: [:new, :create, :show]
  resources :attractions
  resources :rides

end
