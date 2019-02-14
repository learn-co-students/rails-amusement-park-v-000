require 'pry'

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def index

  end

  def current_user
    session[:user_id]
  end

  def redirect_if_logged_out
    if !current_user
      redirect_to root_path
    end
  end
end
