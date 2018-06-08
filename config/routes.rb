Rails.application.routes.draw do

  root 'users#new'
  get '/signin', to: 'sessions#new'
  get '/logout', to: 'sessions#logout'

  resources :sessions, :rides, only: [:create]
  resources :users, :attractions

end


# <%= form_for @user do |f| %>
#   <%= f.label :name %>
#   <%= f.collection_select :name, User.all, :id, :name %>
#   <%= f.label :password %>
#   <%= text_field_tag :password %>
#   <%= submit_tag "Sign In" %>
# <% end %>
