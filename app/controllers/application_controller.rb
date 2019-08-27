class ApplicationController < ActionController::Base
  helper_method :current_user
  protect_from_forgery with: :exception

  def home
    render '/layouts/application'
  end


  def current_user
    if session[:name].nil? || session[:name].empty?
      nil
    elsif session[:name]
      session[:name]
    else
      session[:name] = params[:name]
    end
  end
end
