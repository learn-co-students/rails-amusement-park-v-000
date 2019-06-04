Rails.application.routes.draw do
  resources :users
  #resources :attractions
  #resources :rides

  root 'welcome#home'

#  resources :users, only: [:new, :create]
#  get '/users/:id', :to => 'users#show', :as => "user"
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  post '/logout' => 'sessions#destroy'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
