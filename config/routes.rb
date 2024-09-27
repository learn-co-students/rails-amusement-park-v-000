Rails.application.routes.draw do

  resources :rides
  resources :attractions
  resources :users , only: [:new, :create, :destroy, :show, :index]
  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'
  #get '/', to: 'users#new' -> below is quicker and gives you root_path helper
  root 'users#new'
  post '/logout', to: 'sessions#destroy'
  #resources :sessions, only: [:index, :show, :destroy -> not needed because no restful standards needed on session urls
end
