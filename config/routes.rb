Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:new, :create, :show]
 
  root to: 'application#home'
 # root to: 'sessions#home'
  

  #when the user requests the /home url, then the controller will send them the home view file
  

  get '/new', to: "users#new"
  get '/users/:id', to: "users#show"

  get '/signin', to: "sessions#new", as: "signin"
  post '/signin', to: "sessions#create"

  get '/logout', to: "sessions#destroy"

  get '/attractions', to: "attractions#index"




end



# HTTP Verb:	  Path:	      Controller#Action:	 Used for:
# GET	          /photos	    photos#index	       display a list of all photos