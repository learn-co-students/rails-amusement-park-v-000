# Rails.application.routes.draw do
#   root 'application#home'
#   get 'sessions/new'
#   resources :users
#   resources :rides
#   resources :attractions
#   resources :sessions
#
#   get '/signin', to: 'sessions#sign_in', as: :signin
#   post '/signin', to: 'sessions#create'
#   get '/', to: 'users#new'
#   get '/logout' => 'sessions#destroy'
#   get '/attractions', to: 'attractions#index'
# end


Rails.application.routes.draw do
  	  root "application#home"
  get "/signin", to: "sessions#new"
  delete "/signout", to: "sessions#destroy"
  post "/sessions/create", to: "sessions#create"
  resources :attractions
  resources :users
  resources :rides, only: [:new]
end	
