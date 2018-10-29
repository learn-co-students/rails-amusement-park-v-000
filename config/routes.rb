Rails.application.routes.draw do

   get '/signin' => "sessions#new"
   post '/sessions' => "sessions#create"
   get '/logout' => "sessions#destroy"

     root'users#new'  #=> want this to roots to an index page.

    resources :users, :only => [:new, :create, :show]

end


