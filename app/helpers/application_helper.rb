module ApplicationHelper

  def logged_in?
    !!session[:user_id]
  end

  def current_user
    puts session[:user_id]
    puts logged_in?
    session[:user_id] if logged_in?
  end

end
