Rails.application.routes.draw do
  resources :users
  resources :attractions
  resource :rides, only: [:new, :create]

  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'

  delete '/signout', to: 'sessions#destroy'
  get '/signout', to: 'sessions#destroy'

  post '/rides/create', to: 'rides#create'

  root 'welcome#home'

 #  namespace :admin do
 #  resources :admin, only: [:index, :show]
 #  end

end
