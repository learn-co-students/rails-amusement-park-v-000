Rails.application.routes.draw do
    resources :users, only: [:new, :create, :show]

    get '/signin'  => 'sessions#new'
    post '/signin' => 'sessions#create'
    delete '/logout' => 'sessions#destroy'

    resources :attractions, only: [:index, :show]

    resources :rides, only: [:create]
    root 'users#new'
end
