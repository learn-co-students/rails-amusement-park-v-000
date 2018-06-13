Rails.application.routes.draw do
  get 'users/new' => 'users#new'
  post 'users' => 'users#create'
  get 'sessions/new' => 'sessions#new'
  post 'sessions' => 'sessions#create'

  root 'welcome#home'
end
