Rails.application.routes.draw do
  resources :user
  get '/signin', to: "session#new"
  post '/signin', to: "session#create"
  root "user#new"

end
