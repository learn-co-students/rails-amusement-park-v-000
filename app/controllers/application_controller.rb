class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :current_user
  before_action :require_logged_in, except: [:new, :create, :home]
  
  def require_logged_in
		redirect_to root_path unless logged_in?
	end

  def authentication_required
    if !logged_in?
      redirect_to login_path
    end
  end


 def logged_in?
   !!current_user  #=> this gives us false.... important.
 end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
    # Note: This is a helper method. to be used in the view
    # never call this in your html.erb file.  views never talk directly to the models.
  end

  helper_method :current_user  

end
