module SessionsHelper
=begin
 def require_login
    unless logged_in?
      flash[:error] = "You must be logged in to access this section"
      redirect_to root_path
    end
  end

	def logged_in?
		!!session[:user_id]
	end
=end
end
