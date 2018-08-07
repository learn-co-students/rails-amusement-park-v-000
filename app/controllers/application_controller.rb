class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def is_current_user?(params_id)
    params_id.to_i == session[:user_id]
  end

end
