Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'welcome#index'

  resources :users, :rides, :attractions

  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'

  get '/signout' => 'sessions#destroy'

end
