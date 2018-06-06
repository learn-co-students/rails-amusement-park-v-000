class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def hello
    session[:error_message] = ""
  end

end
