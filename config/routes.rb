Rails.application.routes.draw do
  get '/welcome/home'
  root 'welcome#home'
  resources :users
  get '/signin' => 'sessions#create'
end
