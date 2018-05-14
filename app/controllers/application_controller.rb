class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception


  private

  def require_login
    unless logged_in?
      redirect_to '/'
    end
  end

  def logged_in?
    if User.find_by(id: params[:id])
      @user = User.find_by(id: params[:id])
      session[:user_id] == @user.id
    end
  end
end
