Rails.application.routes.draw do

  root 'application#home'

   resources :users

   controller :sessions do
    get '/login' => :new
    post '/login' => :create
    post '/logout' => :destroy
  end


   get 'attractions/new', as: "new_attraction"
  get 'attractions/create'
  get 'attractions/:id' => "attractions#show", as: "attraction"
  get 'attractions/:id/ride' => "attractions#ride", as: "ride"
  get 'attractions/:id/edit' => "attractions#edit", as: "edit_attraction"
  patch 'attractions/:id' => "attractions#update"
  get 'attractions' => "attractions#index", as: "attractions"



end
