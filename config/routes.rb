Rails.application.routes.draw do
    root :to => 'welcome#index'

    resources :users, only: [:index, :new, :create, :show]
    get 'users/signin', to: 'users#signin'
end
