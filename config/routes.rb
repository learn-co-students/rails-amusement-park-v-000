Rails.application.routes.draw do
  get 'attractions/index'
  resources :users

  resources :attractions, only: [:show] do
    resources :rides, only: [:show]
  end

  get '/signin', to: "sessions#new"
  post '/signin', to: "sessions#create"
  post '/signout', to: "sessions#destroy"
  get '/', to: "welcome#home"

end
