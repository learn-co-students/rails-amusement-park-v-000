Rails.application.routes.draw do

	root to: 'application#home'
	get '/attractions/new', to: 'attractions#new'
	resources :users, only: [:new, :create, :show]
	get '/signin', to: 'sessions#new'
	post '/signin', to: 'sessions#create'
	delete '/logout', to: 'sessions#destroy'
	# get '/attractions/:id', to: 'attractions#show'
	
	resources :attractions, only: [:index, :show, :create]
  
end
