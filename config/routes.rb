Rails.application.routes.draw do
  root :to => 'users#new'
  resources :users
  resources :attractions

  get '/signin', action: :new, controller: "sessions"
  post '/signin', action: :create, controller: "sessions"
  get '/logout', action: :destroy, controller: "sessions"
  post '/attractions/:id', action: :ride, controller: "attractions"

end
