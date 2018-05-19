Rails.application.routes.draw do
  
  resources :users, only: [:new, :create, :show]
  get '/users/:id/tickets', to: 'users#buy_tickets'
  post '/users/:id/tickets', to: 'users#update_tickets'
  get '/signin', to: 'sessions#new'
  post '/sessions', to: 'sessions#create'
  get '/signout', to: 'sessions#destroy'
  resources :attractions, only: [:new, :create, :index, :show, :edit, :update] do
    resources :rides, only: [:create]
  end
  root 'application#home'
  
end
