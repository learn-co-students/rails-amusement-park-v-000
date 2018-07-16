Rails.application.routes.draw do
    root :to => 'users#index'

    get 'signin', to: 'users#signin'
    post 'signin', to: 'users#login'
    resources :users, only: [:index, :new, :create, :show]

end
