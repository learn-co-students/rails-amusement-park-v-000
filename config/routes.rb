Rails.application.routes.draw do

     root 'users#home'
    get '/signup', to: 'users#new'
    get '/signin', to: 'sessions#new'
    get '/sessions/destroy' => 'sessions#destroy'
    post '/signin' => 'sessions#create'

    resources :attractions
    resources :rides
    resources :users

end
