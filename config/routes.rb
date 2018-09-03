Rails.application.routes.draw do
  root 'application#home'
  resources :users
  resources :attractions

  get '/signin', to: 'sessions#sign_in', as: :signin
  post '/signin', to: 'sessions#create'
  get '/', to: 'users#new'
  get '/logout' => 'sessions#destroy'
  get '/attractions', to: 'attractions#index'
end
