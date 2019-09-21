Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#home'
  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  post '/rides', to: 'rides#create'
  resources :users, only: [:new, :create, :show] 
  resources :attractions, only: [:index, :show, :new, :create, :edit, :update] 
end
