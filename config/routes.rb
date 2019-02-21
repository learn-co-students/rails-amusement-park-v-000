Rails.application.routes.draw do

	root 'application#index'

	get '/signin' => 'application#signin', as: 'login'
	post '/signin' => 'application#authenticate'

	get '/signout' => 'application#signout', as: 'logout'
	resources :users, only: [:new, :create, :show, :update]
	resources :attractions
end
