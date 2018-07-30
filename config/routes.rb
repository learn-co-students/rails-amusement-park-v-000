Rails.application.routes.draw do
  resources :users
  get '/signin', to: "sessions#new"
  post '/signin', to: "sessions#create"
  delete '/signout', to: "session#destroy"
  get '/', to: "welcome#home"
end
