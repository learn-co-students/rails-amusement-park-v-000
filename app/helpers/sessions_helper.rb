module SessionsHelper

  def login?
    session.include? :user_id
  end

  def log_out
    session.delete(:user_id)
  end

  def current_user
    if session[:user_id]
      @current_user ||= User.find_by(id: session[:user_id])
    end
  end

end
