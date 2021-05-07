Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :rides
  resources :users
  resources :attractions

  get '/', to: 'application#home', as: 'root'

  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'

  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'

  get '/signout', to: 'sessions#destroy'
end
