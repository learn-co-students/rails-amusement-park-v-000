Rails.application.routes.draw do

      root 'welcome#home'

      resources :users, only: [:new, :create, :show]
      resources :attractions

      get '/signin', to: "session#new"
      post '/signin', to: 'session#create'
      delete '/session', to: 'session#destroy'
      post '/rides', to: "rides#create"

end
