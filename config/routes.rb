Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'static#home'
  resources :users, only: [:new, :create, :show]

  get '/signin' => 'users#signin'
  post '/signin' => 'users#create_signin'
  post '/logout' => 'users#destroy'

  resources :attractions, only: [:index, :show]
end
