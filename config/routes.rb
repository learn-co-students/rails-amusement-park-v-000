Rails.application.routes.draw do
  get 'rides/show'
  get 'attractions/index'
  resources :users

  resources :attractions, only: [:show] do
    resources :attractions, only: [:ride]
  end

  get '/signin', to: "sessions#new"
  post '/signin', to: "sessions#create"
  post '/signout', to: "sessions#destroy"
  get '/', to: "welcome#home"

end
