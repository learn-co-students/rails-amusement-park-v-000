Rails.application.routes.draw do
    root 'application#index'
    resources :users
    resources :attractions
    get '/signin' => 'sessions#new'
    post '/signin' => 'sessions#create'
    get '/signout' => 'sessions#destroy'
    post '/signout' => 'sessions#destroy'
    post '/rides/new' => 'rides#new'
end
