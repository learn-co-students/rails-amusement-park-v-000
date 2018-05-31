Rails.application.routes.draw do

  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  resources :users, only: [:new, :create, :show]
  resources :attractions, only: [:index, :new, :create, :show, :edit, :update]
  resources :rides, only: [:create]

  namespace :admin do
    resources :attractions, only: [:index, :new, :create, :edit, :show]
  end

  root 'welcome#home'
end
