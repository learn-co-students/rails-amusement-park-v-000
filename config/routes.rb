Rails.application.routes.draw do
    
    root 'static#home'
    
    resources :users, :attractions
    post "/rides/new", to: "rides#new"

    # sessions
    get '/signin' => 'sessions#new'
    post '/sessions/create' => 'sessions#create'
    delete '/signout' => 'sessions#signout'
end