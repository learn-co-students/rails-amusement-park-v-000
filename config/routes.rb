Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'users#home' # => need to update, placeholder for now
  resources :users
  resources :attractions
  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'
  # post '/users/:id' 'users#show/:id'
  # use namespaced routes for admin section
end
