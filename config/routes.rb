Rails.application.routes.draw do
    resources :users, only: [:new, :create, :show, :update]
    resources :attractions, only: [:index, :new, :create, :show, :edit, :update]
    resources :sessions, only: [:create, :destroy]
    resources :rides, only: [:create]

    root 'welcome#home'
    get 'signin' => 'sessions#new'
    get 'signup' => 'users#new'
    get 'logout' => 'sessions#destroy'
    # post '/users/:id' => 'users#show'
    #match "user/account" => "user#account", as: :user_account, via: [:get, :post]

end
