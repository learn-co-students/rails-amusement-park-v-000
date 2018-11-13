module ApplicationHelper
 def require_login
    unless logged_in?
      flash[:error] = "You must be logged in to access this section"
      redirect_to root_path 
    end
  end

  def logged_in?
    !!session[:user_id]
  end

	def hot_user
		User.find_by(id: session[:user_id]) if logged_in?
	end

	def admin?
		user = hot_user
		user.admin
	end
end
