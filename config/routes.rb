Rails.application.routes.draw do
	root 'users#new'
	get '/signin' => 'users#signin'
	post '/signin' => 'users#edit'
	resources :users, only: [:new, :create, :show]  
end
