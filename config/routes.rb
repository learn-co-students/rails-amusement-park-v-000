Rails.application.routes.draw do
  root 'welcome#home'
  get 'signin', to: 'sessions#new'
  post 'signin', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  resources :users, only: [:new, :create, :show]
  resources :attractions do
    resources :rides, only: [:create]
  end
  # resources :attractions, only: [:new, :index, :show]
  # scope '/admin' do
  #   resources :attractions, only: [:new, :edit, :update]
  # end

end
