Rails.application.routes.draw do
    get '/', to: 'welcome#index', as: 'root'
    
    get    '/signin',   to: 'sessions#new'
    post   '/signin',   to: 'sessions#create'
    match  '/logout',   to: 'sessions#destroy', via: :delete
    
    resources :users, only: [:new, :create, :show]
    resources :attractions
    resources :rides
end
