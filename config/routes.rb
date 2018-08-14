Rails.application.routes.draw do
  Rails.application.routes.draw do
  root 'users#index'
  resources :users
  resources :sessions

  get '/signin', to: 'sessions#new'
  get '/logout', to: 'sessions#destroy'

end

end
