form helpers, interacting models, sessions 
-- users, attractions, rides. 
    -- users take rides on attractions 
do model tests first
    rspec name of testfile
use --no-test-framework
use bcrypt and has_secure_password 

so confused. 

set up login pages, and how to do separate nav bars 
if admin: layouts, etc. 

flash[:alert]= ""
flash[:notice]= ""

Action
signup -- user -> user/new, to user/show


It gets more complicated, and then has to be pruned, weeded, divided, to use the language of gardening, or weaned, differentiated, individualized, matured, to use the language of childraising, neither of which are usually coordinated with technology, but here we are. When I'm stuck, I pop outside to garden (it's May, prime season for moving, shifting vision, hauling mulch)

I can do this. Step by step.

namespacing -- creates a module -- organize all the sessions/authenticiations, confirmations/users 
new folder -- auth, 
move the other files onto auth. 
add class Auth::UsersController < ApplicationController

create: class Auth::BaseController < ApplicationCOntroller
	add things that other controllers can inherit from -- 
	so: class Auth::ConfirmationsController < Auth::BaseController 

Then change them all so they inhert from Auth:BaseController 

in routes;; auth/sessions#new
auth/sessions#destroy, etc. 

in routes 
namespace :auth do
	resources :users, onlu: [:create]
	resources :session, only: [:create]
	resources :confirmation
end

move views into auth:
	create new folder called Auth in views and move all those classes views into auth.

select 
	select_tag
	collection_select 

<%= f.collection_select(:user_name User.all, :id, :name) %>
	
	<%= f.select(:user_name) do %>
		<% 



    <%= f.label :password_confirmation, "Password Confirmation" %>
    <%= Password Confirmation: <%= f.password_field :password_confirmation %>

set_user 
	@user = User.find(params[:id])
 before_action :set_user, only: [:show, :edit, :update, :destroy]
