class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include LoginHelper
  # before_action :login_required, except [:new, :create, :home]#any exceptions? 
  before_action :current_user

  def login_required
    if !logged_in?
      redirect_to login_path, :notice => "Please login."
    end
  end

  # def logged_in?
  #   !!current_user
  # end 

  def current_user 
      @current_user ||= User.find_by(id: session[:user_id])

      # @current_user ||= User.find_by_id(session[@user.id])
      #use find_by not find, bec find raises an exception   and find_by returns nil. 
  
  end 

end
