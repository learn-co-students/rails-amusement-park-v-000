module SessionsHelper

  #logs in the given user
  def log_in(user)
    session[:user_id] = user.id
  end

  #Returned the current logged-in user (if any).
  def current_user
    @current_user ||= User.find_by_id(session[:user_id]) if session[:user_id]
  end

  #returns true if the user is logged in, false otherwise
  def logged_in?
    !!session[:user_id]
  end

  def redirect_if_not_logged_in
    redirect_to '/' if !logged_in?
  end

  #logs out the current user
  def log_out
    session.delete(:user_id)
    @current_user = nil
  end
end