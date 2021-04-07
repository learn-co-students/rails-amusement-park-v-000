Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'users#welcome'
  get '/signin' => 'users#signin', as: :signin
  post '/login' => 'users#login', as: :login
  resources :users, only: [:new, :show, :create, :edit, :update]
  resources :attractions
end
