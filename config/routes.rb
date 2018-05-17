Rails.application.routes.draw do
  root 'static_pages#home'

  resources :users, only: [:new, :create, :show]

  get '/attractions', to: 'attractions#index'
  get '/attractions/:id', to: 'attractions#show'

  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
end
