Rails.application.routes.draw do

  resources :users

  root 'application#home'

  get '/signin', to: 'sessions#new'

  post '/signin', to: 'sessions#create'

end
