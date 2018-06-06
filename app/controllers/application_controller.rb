class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include ApplicationHelper

  def hello
    # session[:error_message] = ""
    flash[:notice] = ""
  end

end
