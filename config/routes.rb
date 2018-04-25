Rails.application.routes.draw do
    root "static_pages#home"
    resources :users, only: [:new, :create, :edit, :update, :show]
    get "/signin" => "sessions#new"
    post "/sessions" => "sessions#create"  
    get "/logout" => "sessions#destroy"
    resources :attractions
    post "/rides" => "rides#create"

end
