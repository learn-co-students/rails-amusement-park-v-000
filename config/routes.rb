Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'users#home'

  resources :users
  resources :attractions

  get '/signin', to: 'users#signin'

  post '/login', to: 'users#login'

  get '/logout', to: 'users#destroy'

end