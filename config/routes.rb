Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'application#home'
  resources :users

  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'

  #  get '/login' => 'sessions#new'
  #  post '/login' => 'sessions#create'
end
