Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'users#home'
  resources :users, only: [:new, :show]
  #get '/users/new', to: 'users#new'
  post '/users/new', to: 'users#create'
end
