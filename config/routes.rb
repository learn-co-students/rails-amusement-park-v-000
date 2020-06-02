Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'application#home'

  get '/signin', to: 'sessions#signin'
  post '/signin', to: 'sessions#create'

  resources :users
end
