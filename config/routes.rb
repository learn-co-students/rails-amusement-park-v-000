Rails.application.routes.draw do
  resources :rides
  resources :attractions
  resources :users
  get '/', to: 'application#home'
  get '/signin', to: 'sessions#new', as: 'signin'
  post '/signin', to: 'sessions#create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
