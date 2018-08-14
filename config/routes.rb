Rails.application.routes.draw do
  
  get 'sessions/new'
  resources :users
  resources :rides
  resources :attractions
  resources :sessions 
  
  get '/attractions', to: 'attractions#index'
  get '/users/:id', to: 'users#show'
  get '/users/new' => 'users#new'
  get '/', to: 'users#new'
  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  get  '/logout' => 'sessions#destroy'
  post '/signout' => 'sessions#destroy'
  
  
end
