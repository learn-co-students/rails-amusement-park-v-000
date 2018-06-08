class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :login

  def login
    session[:user_id] = User.find_by(name: params[:user][:name]).id
  end

  private

  def user_params(*args)
    params.require(:user).permit(:name, :nausea, :happiness, :tickets, :height, :password, :admin)
  end

end
