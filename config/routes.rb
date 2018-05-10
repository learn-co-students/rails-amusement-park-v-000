Rails.application.routes.draw do
    root 'users#index'
    resources :users
    resources :attractions
    resources :rides
    
    get '/signin' => 'sessions#new'
    post '/signin' => 'sessions#create'
    get '/logout' => 'sessions#destroy'
   


end
