Rails.application.routes.draw do
  # resource :users, only: [:new, :create, :show]
  get '/users/new', to: 'users#new', as: 'signup'
  post '/users', to: 'users#create'
  get '/users/:id', to: 'users#show', as:'user'
  get '/', to: 'users#welcome', as: 'root'

  get '/signin', to: 'sessions#new'
  post '/sessions', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy', as: 'logout'

  get '/attractions', to: 'attractions#index', as: 'attractions'
  get '/attraction/:id', to: 'attractions#show', as: "attraction"

end
