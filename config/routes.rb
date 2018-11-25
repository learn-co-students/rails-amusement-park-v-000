Rails.application.routes.draw do

  resources :users

  resources :sessions

  resources :attractions

  resources :rides, only: [:new]

  root :to => 'welcome#greet'

  get '/signin' => 'sessions#new'

  get "/signout", to: "sessions#clear"

end
