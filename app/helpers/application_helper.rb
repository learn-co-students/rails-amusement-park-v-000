module ApplicationHelper

  def user_signup
    session[:user_id] = @user.id
  end

  def user_login
    session[:user_id] = @user.id
  end

  def admin_signup

  end

  def admin_login

  end

  def current_user
    !!session[:user_id]
  end

end
