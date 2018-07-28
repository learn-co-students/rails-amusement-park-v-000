Rails.application.routes.draw do
  resources :users
  get '/signin', to: "sessions#new"
  post '/signin', to: "sessions#create"
  get '/', to: "welcome#home"
end
