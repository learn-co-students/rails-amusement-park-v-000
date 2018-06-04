Rails.application.routes.draw do
  
  get 'static_pages/home'
  get 'sessions/destroy'
  get 'sessions/new'
  get 'sessions/create'
  get 'rides/new'
end
