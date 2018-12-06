Rails.application.routes.draw do

  root 'welcome#home'

  get '/signin' => 'sessions#new'
  post '/sessions/create' => 'sessions#create'

  delete "/signout" => 'sessions#destroy'

  resources :users


end
