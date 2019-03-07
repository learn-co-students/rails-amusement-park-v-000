Rails.application.routes.draw do

	root 'application#home'
	resources :sessions, only: [:new, :create]
	delete 'sessions', to: 'sessions#destroy'
  get 'signin', to: 'sessions#new'
  resources :users 
  resources :rides, only: [:create]
  resources :attractions

end
