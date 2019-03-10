Rails.application.routes.draw do

resources :users, only: [:new, :create, :show]


resources :rides

   get '/signin' => 'sessions#new'
   post '/signin' => 'sessions#create'
   get '/login' => 'sessions#new'
   post '/login' => 'sessions#create'
   get '/logout' => 'sessions#destroy'

   get '/attractions' => 'attractions#home'
   get '/attractions/new' => 'attractions#new'
   get '/attractions/:id' => 'attractions#show'
   get '/attractions/:id/edit' => 'attractions#edit'

   patch '/attractions/:id'=> 'attractions#update'

  root 'users#home'

end
