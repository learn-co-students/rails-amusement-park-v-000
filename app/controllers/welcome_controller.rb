class WelcomeController < ApplicationController

  def home
    if session[:user_id]
      redirect_to user_path(session[:user_id])
    else
      @user = User.new
      render :template => "sessions/new"
    end
  end

end
