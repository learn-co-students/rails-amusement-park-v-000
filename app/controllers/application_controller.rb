class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  require 'pry'
  before_action :current_user
  before_action :require_login, except: [:new, :create, :home]

  def current_user
    session[:user_id]
  end

  private
  def require_login
    redirect_to root_path unless current_user
  end
end
