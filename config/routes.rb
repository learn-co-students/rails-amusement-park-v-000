Rails.application.routes.draw do

  root "applications#home"
  resources :users
end
