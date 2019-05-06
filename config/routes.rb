Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'static_pages#home'

    get "/signin", to: "sessions#new"
    post "/sessions/create", to: "sessions#create"
    delete "/signout", to: "sessions#destroy"
    post "/rides/new", to: "rides#new"

    resources :users

    resources :attractions

end
