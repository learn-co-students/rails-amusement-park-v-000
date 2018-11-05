Rails.application.routes.draw do

  get 'attractions/index'
   get '/signin' => "sessions#new"
   post '/sessions' => "sessions#create"
   delete '/logout' => "sessions#destroy"

     root'users#new'  #=> want this to roots to an index page.

    resources :users, :only => [:new, :create, :show]
    resources :attractions, :only => [:index, :show, :new, :create]
    resources :rides, :only => [:new]

    post '/rides/new' => "rides#new"
  

end


