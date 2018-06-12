class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :logged_in?, :current_user, :admin

  private
    def user_params
      params.require(:user).permit(:name, :height, :happiness, :nausea, :tickets, :admin, :password, :id)
    end

    def current_user(user_id=nil)
      user_id ? session[:user_id] = user_id : User.find(session[:user_id])
    end

    def logged_in?
      !!session[:user_id]
    end


    def require_login
     return head(:forbidden) unless session.include? :user_id
    end

    def fields_blank?
      user_params[:name].empty? && user_params[:password].empty?
    end

    def signup_fields_present?
      !user_params[:name].empty? && !user_params[:password].empty? && !user_params[:height].empty? && !user_params[:happiness].empty? && !user_params[:nausea].empty? && !user_params[:tickets].empty?
    end

    def admin
      !!current_user.admin
    end
end
