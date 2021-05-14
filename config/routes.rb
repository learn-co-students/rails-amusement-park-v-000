Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'static#home'
  resources :users, only: [:new]
  #get '/users/new', to: 'users#new'
  #post '/users/new', to: 'users#create'
end
