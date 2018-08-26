Rails.application.routes.draw do
  root 'homepage#home'
  get '/users/new' => 'users#new'
end
