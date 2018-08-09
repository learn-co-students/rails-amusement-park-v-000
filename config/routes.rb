Rails.application.routes.draw do
    resources :users

    get '/signin'  => 'sessions#new'
    post '/signin' => 'sessions#create'
    delete '/logout' => 'sessions#destroy'

    resources :attractions, only: [:index, :show]

    root 'users#new'
end
