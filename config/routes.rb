Rails.application.routes.draw do
  root 'welcome#home'
  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  resources :users, only: [:new, :create, :show, :destroy]
  resources :attractions, only: [:index, :show, :new, :create, :edit, :update]
  resources :rides, only: [:create]
end
