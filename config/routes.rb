Rails.application.routes.draw do
    root "static_pages#home"
    resources :users, only: [:new, :create, :edit, :update, :show]
    get "/signin" => "sessions#new"
    post "sessions" => "sessions#create"  
end
