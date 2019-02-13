Rails.application.routes.draw do

    root 'welcome#home'


    get '/signin' => 'sessions#new'
    post '/signin' => 'sessions#create'
    post '/signout' => 'sessions#destroy'
    delete "/signout", to: "sessions#destroy"

    resources :attractions
    resources :users, only: [:new, :create, :show]

    post '/rides/new' => 'rides#new'



end
