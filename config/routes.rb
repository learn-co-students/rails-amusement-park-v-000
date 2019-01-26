Rails.application.routes.draw do
 
    root 'static_pages#home'
    get '/signin' => 'sessions#new'
    post '/signin' => 'sessions#create'
    post 'logout', to: 'sessions#destroy'
    resources :attractions
    resources :rides
    resources :users, only: [:new, :create, :show]
end
