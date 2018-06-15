module ApplicationHelper
  def logged_in?
    !!session[:user_id]
  end

  def current_user
    if logged_in?
      User.find_by_id(session[:user_id])
    end
  end

end
