class SessionController < ApplicationController
  skip_before_action :verify_user_is_authenticated, only: [:new,:create]
  def new
    @user = User.new
  end

  def create
    if @user = User.find_by(name:params[:name])
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      render 'new'
    end
  end
end