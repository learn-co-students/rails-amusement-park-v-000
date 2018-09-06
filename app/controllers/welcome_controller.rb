class WelcomeController < ApplicationController

  def index
    if session[:user_id].present?
      @user = User.find(session[:user_id])
      redirect_to user_path(@user)
    end
  end

end
