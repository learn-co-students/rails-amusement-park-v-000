Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:new, :create, :show]
 
 # root to: 'application#home'
  root to: 'users#login'
  

  #when the user requests the /home url, then the controller will send them the home view file
  get '/home', to: "welcome#home"
  get '/new', to: "users#new"
end
