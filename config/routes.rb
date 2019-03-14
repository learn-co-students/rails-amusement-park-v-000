Rails.application.routes.draw do
 
get '/' => 'users#home'
get 'users/new' => 'users#new'
get '/signup' => 'users#new'
post '/users' => 'users#create'
get '/signin' => 'sessions#new'
post '/login' => 'sessions#create'
get '/logout' => 'sessions#destroy'
get '/users/:id' => 'users#show'
get '/attractions' => 'attractions#index'
post '/rides/new' => 'rides#create', as: 'rides'
get 'attractions/new' => 'attractions#new', as: 'attractions_new'
post '/attractions' => 'attractions#create'
get '/attractions/:id/edit' => 'attractions#edit', as: 'attractions_edit'
get '/attractions/:id' => 'attractions#show', as: 'attraction'
get '/adminindex' => 'attractions#adminindex'
patch '/attractions/:id' => 'attractions#update'
end
