module ApplicationHelper
  def current_user
    User.find_by_id(session[:user_id]) if is_signed_in?
  end

  def is_signed_in?
    !!session[:user_id]
  end
end
