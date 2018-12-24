class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def in_session?
    !!session[:user_id]
  end

  def home
    if in_session?
      @user = User.find(session[:user_id])
    else
      redirect_to '/login'
    end
  end
end
