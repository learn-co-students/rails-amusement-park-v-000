Rails.application.routes.draw do
  get 'users/new'
	get 'users/create'
	get '/signin' => 'sessions#new'
	post '/signin' => 'sessions#create'
	get '/logout' => 'sessions#destroy'
	post '/rides' => 'rides#ride'
	resources :users, :attractions, :rides

	root 'static_pages#home'

end
