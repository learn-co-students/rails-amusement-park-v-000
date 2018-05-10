Rails.application.routes.draw do
 
	root 'application#welcome'
  
  resources :users,  only: [:new, :create, :show]

  get '/signin', to: 'sessions#new'
  post '/sessions', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
end
