Rails.application.routes.draw do
 root "application#index"
 get "/signin", to: "sessions#signin"
 post "/signin", to: "sessions#login"
 post "/rides/new", to: "rides#update"
 delete "/logout", to: "sessions#destroy"
 resources :users  #[:index,:show,:create, :new, :update]
 resources :attractions

end
