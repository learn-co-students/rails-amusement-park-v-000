Rails.application.routes.draw do
  root :to => 'users#new'
  get '/signin' => 'sessions#new'
  post '/sessions' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
  delete "/logout", to: "sessions#destroy"


  resources :users, only: [:new, :show, :create]
  resources :attractions, only: [:new, :show, :create, :index, :edit, :update]
  resources :rides, only: [:new, :show, :create]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
