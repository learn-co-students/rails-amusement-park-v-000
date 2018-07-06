Rails.application.routes.draw do

  root 'welcome#home'

  get '/signin', to: "sessions#new"

  resources :users
  resources :sessions

end
