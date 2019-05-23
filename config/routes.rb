Rails.application.routes.draw do
  root 'sessions#home'
  get 'signin' => 'sessions#new'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
  resources :rides
  resources :attractions
  resources :users, only: [:index, :new, :create, :show, :edit, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
