Rails.application.routes.draw do
  resources :rides
  resources :users
  resources :attractions
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/signin', to: 'sessions#new', as: 'signin'
  post '/signin', to: 'sessions#create', as: 'create_session'
  get '/', to: 'application#home', as: 'root'
  get '/signout', to: 'sessions#signout', as: 'signout'
end
