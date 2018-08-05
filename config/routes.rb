Rails.application.routes.draw do
  root 'sessions#home'
 #change to signin. Need post and get routes for it
  resources :users

  get '/users/new' => 'users#new', :as => '/signup'
  post '/users/create' => 'users#create'

end
