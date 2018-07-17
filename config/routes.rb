Rails.application.routes.draw do
    root :to => 'users#home'

    get 'signin', to: 'users#signin'
    post 'signin', to: 'users#login'

    resources :users, only: [:index, :new, :create, :show, :destroy]
    resources :attractions, only: [:index, :show]

end
