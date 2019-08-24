Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:new, :create, :show]
  resources :attractions do
    resources :rides, only: [:create]
  end
  
  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  post '/signout' => 'sessions#destroy'
  root 'users#welcome'
end
