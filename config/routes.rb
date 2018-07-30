Rails.application.routes.draw do
  get 'attractions/index'
  resources :users
  resources :attractions
  get '/signin', to: "sessions#new"
  post '/signin', to: "sessions#create"
  post '/signout', to: "sessions#destroy"
  get '/', to: "welcome#home"
end
