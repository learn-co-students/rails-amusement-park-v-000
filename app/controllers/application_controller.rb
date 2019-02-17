class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
   before_action :require_login, except: [:new, :create, :index]




 # Finds the User with the ID stored in the session with the key
 # :current_user_id This is a common way to handle user login in
 # a Rails application; logging in sets the session value and
 # logging out removes it.
 private


 def current_user
   if session[:user_id]
     @current_user ||= User.find(session[:user_id])
   end
  end

 def logged_in?
     !!current_user
 end

   def require_login

     if !logged_in?
       #flash[:error] = "You must be logged in to access this section"
       redirect_to root_path # halts request cycle

     end
   end
end
