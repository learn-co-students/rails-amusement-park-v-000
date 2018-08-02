Rails.application.routes.draw do
  get '/users/new' => 'users#new'
  post '/users/create' => 'users#create'
end
