module ApplicationHelper

  # Check if User Logged In
  def logged_in?
    !!session[:user_id]
  end

  # Gets currently logged in user via session hash
  def current_user
    if @user
      return @user
    else
      if logged_in?
        @user = User.find(session[:user_id])
      end
    end
  end

  # Automatically redirects if user not logged in and trying to view locked page
  def redirect_if_not_logged_in
    if !logged_in?
      # session[:error_message] = "You need to be logged in to do that."
      flash[:notice] = "You need to be logged in to do that."
      redirect_to root_path
    end
  end

end

# https://stackoverflow.com/questions/13613223/where-to-put-ruby-helper-methods-for-rails-controllers
