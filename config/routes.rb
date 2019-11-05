Rails.application.routes.draw do
    root "welcome#index"
    resources :users
    resources :attractions

    get '/signin' => "sessions#new"
    post '/signin' => "sessions#create"
    delete '/signout' => "sessions#sign_out"

     post '/ride' => "rides#new"

end
