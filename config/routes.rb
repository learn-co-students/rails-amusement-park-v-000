Rails.application.routes.draw do
    root "static_pages#home"
    get "/users/new" => "users#new"
    post "users" => "users#create"
    get "sessions/new" => "sessions#new"
    post "sessions" => "sessions#create"

end
