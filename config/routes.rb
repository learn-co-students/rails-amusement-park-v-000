Rails.application.routes.draw do
	root 'users#new'
	get '/signin' => 'users#signin'
	post '/signin' => 'users#edit'
	post '/logout' => 'users#destroy'
	resources :users, only: [:new, :create, :show] do
		#resources :attractions, only: [:index]
	end 
	resources :attractions, only: [:index, :show, :update, :new, :create, :edit]
end
