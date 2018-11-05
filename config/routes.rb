Rails.application.routes.draw do
  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  post '/logout' => 'sessions#destroy'

  resources :users, except: [:index, :destroy]
  resources :attractions, except: [:destroy]
  resources :rides, only: :create

  root 'welcome#home'
end
