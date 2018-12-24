class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def in_session?
    !!session[:user_id]
  end

  def home
    if in_session?
      @user = User.find(session[:user_id])
      redirect_to "/users/#{@user.id}"
    else
      redirect_to '/signin'
    end
  end
end
