Rails.application.routes.draw do

  root 'static_pages#home'
  get '/users/new' => 'users#new'
  post '/users/new' => 'users#create'
  get '/users/:id' => 'users#show'
  get '/login' => 'sessions#new'
  get '/signin' => 'sessions#new'
  post '/signin'=>'sessions#create'
  post '/sessions'=>'sessions#create'
  get '/logout'=>'sessions#destroy'
  post '/logout'=>'sessions#destroy'
  delete '/logout'=>'sessions#destroy'
  get '/attractions' => 'attractions#index'
  get '/attractions/new' => 'attractions#new'
  post '/attractions/new'=> 'attractions#create'
  get '/attractions/:id' => 'attractions#show'
  post '/attractions/buy/:id' => 'attractions#go_on_a_ride'
  get '/attractions/:id/edit'=>'attractions#edit'
  post '/attractions/:id/edit'=>'attractions#update'
  resources :users
  resources :rides
  resources :attractions

end
