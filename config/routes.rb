Rails.application.routes.draw do
  get '/welcome/home'
  root 'welcome#home'
  resources :users
  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  post '/signout' => 'sessions#destroy'

end
