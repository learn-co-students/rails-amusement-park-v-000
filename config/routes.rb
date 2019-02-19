Rails.application.routes.draw do
  get 'attractions/new'
  get 'attractions/create'
  get 'attractions/:id' => "attractions#show", as: "attraction"
  get 'attractions/:id/ride' => "attractions#ride", as: "ride"
  get 'attractions/:id/edit' => "attractions#edit", as: "edit_ride"
  patch 'attractions/:id' => "attractions#update"
  get 'attractions' => "attractions#index"

  get 'sessions/new'
  post 'attractions' => "attractions#create"
  root 'application#index'
  get '/signin' => 'sessions#new'
  post '/sessions' => 'sessions#create'
  get '/logout' => "sessions#destroy"
  resources :users, only: [:create, :new, :show, :index]
end
