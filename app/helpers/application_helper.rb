module ApplicationHelper

  def logged_in?
    !!session[:user_id]
  end

  def current_user
    session[:user_id] if logged_in?
  end

  def is_admin?
    logged_in? ? User.where("id = ?", current_user).select("admin").first[:admin] : nil
  end

end
