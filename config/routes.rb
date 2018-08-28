Rails.application.routes.draw do
  root to: 'application#welcome'
  get '/users/new', to: 'users#new'
  post '/users/new', to: 'users#create'

end
