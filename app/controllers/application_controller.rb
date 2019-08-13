class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # def authentication_required
  #   if !logged_in?
  #     redirect_to new_user_path
  #   end
  # end

  def logged_in?
    @user = User.find_by(:id => session[:user_id])
  end
end
