module SessionsHelper

  def logged_in?
    !!session[:user_id]
  end

  def current_user
    User.find(session[:user_id]) if logged_in?
  end

end
