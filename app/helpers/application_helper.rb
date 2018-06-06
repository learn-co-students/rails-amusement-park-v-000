module ApplicationHelper

  def logged_in?
    !!session[:user_id]
  end

  def current_user
    if @user
      return @user
    else
      if logged_in?
        @user = User.find(session[:user_id])
      end
    end
  end

  def redirect_if_not_logged_in
    if !logged_in?
      # session[:error_message] = "You need to be logged in to do that."
      flash[:error] = "You need to be logged in to do that."
      redirect to "/signin"
    end
  end

end
