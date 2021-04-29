class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user
  helper_method :logged_in?
  before_action :authenticated_user

  def current_user
    # how do we set up the variable 
    # so this doesn't need to be looked up each time?
    # I didn't capture it from any lessons/videos
    User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !!current_user
  end

  def authenticated_user
    # remember to redirect to the proper path,
    # check logged in, AND ensure the proper
    # proper hooks are set, in this case
    # skip_before_action that I devined
    # from the solution
    redirect_to root_path unless logged_in?
  end

end
