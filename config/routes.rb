Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'static#home'
  resources :users
  get '/users/new', to: 'users#new'
  post '/users/new', to: 'users#create'
  resources :sessions
  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  get '/signout' => 'sessions#destroy'
  resources :attractions
  #get '/attactions' => 'attractions#index'
  #post '/attraction' => 'attractions#show'
  get '/attractions/new', to: 'attractions#new'
  post '/attractions/new', to: 'attractions#create'
  get '/attractions/:id/edit', to: 'attractions#edit', as: :edit_article
  post '/attractions/:id/edit', to: 'attractions#update' #patch wasn't needed for this one
  resources :rides
  post '/rides/new' => 'rides#new'
  post '/rides', to: 'rides#create', as: "create_ride"  #making new path for attractions page 
  #https://guides.rubyonrails.org/routing.html
end
