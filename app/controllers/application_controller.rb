class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  helper_method :current_user, :logged_in?, :is_admin?

  layout 'application'
  
  def index

  end

  def signin
  	if logged_in?
  		user = current_user
  		redirect_to user_path(user)
  	end
  end

  def signout
  	session.delete(:user_id)
  	redirect_to root_url
  end

  def authenticate
  	user = User.find_by(:name => params[:user][:name])

  	if user && user.authenticate(params[:password])
  		session[:user_id] = user.id
  		redirect_to user_path(user)
  	else
  		redirect_to '/signin'
  	end
  end

  def current_user
  	User.find_by(:id => session[:user_id])
  end

  def logged_in?
  	!!current_user
  end

  def is_admin?
  	current_user.admin
  end

end
