Rails.application.routes.draw do
  
    root 'static#index'
    get '/signup' => 'users#new'
    post '/signup' => 'users#create'
    
    get '/signin' => 'sessions#new'
    post '/signin' => 'sessions#create'
    delete '/signout' => 'sessions#destroy'

    # patch 'attractions/:id/take_ride' => 'attractions#take_ride', as: :attractions_take_ride
    post "/rides/new", to: "rides#new"

    resources :sessions
    resources :users
    resources :attractions
    resources :rides

end
