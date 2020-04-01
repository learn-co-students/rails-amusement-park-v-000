Rails.application.routes.draw do
	root 'users#index'
	get '/signin', to: 'sessions#signin'
	post '/login', to: 'sessions#login'
	post '/logout', to: 'sessions#logout'
	post '/ride', to: 'attractions#ride'

	resources :users, :attractions
end
