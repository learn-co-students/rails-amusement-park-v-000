Rails.application.routes.draw do

    root "welcome#homepage"

    get "/signin", to: "sessions#new"

    post "/signin", to: "sessions#create"

    delete "/signout", to: "sessions#destroy"

    resources :users

    resources :attractions
end
