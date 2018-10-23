module SessionsHelper

  def logged_in?
    session[:user_id] == @user.id 
  end
end
