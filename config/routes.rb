Rails.application.routes.draw do
  root to: "attractions#home_page"

  get '/signin',     to: 'sessions#new'
  post '/signin',    to: 'sessions#create'
  delete '/signout', to: 'sessions#destroy'
  post '/rides', to: 'attractions#rides'

  resources :users, :attractions
end
