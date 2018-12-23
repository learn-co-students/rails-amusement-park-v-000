Rails.application.routes.draw do

    root 'welcome#home'


    get '/login' => 'sessions#new'
    post '/login' => 'sessions#create'
    post '/logout' => 'sessions#destroy'

    resources :users
    resources :users, only: [:new, :create, :show]



end
