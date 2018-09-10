require 'rack-flash'

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :current_user
  use Rack::Flash

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  helper_method :current_user #this makes it available in the views, or create helper module in concerns folder

end
