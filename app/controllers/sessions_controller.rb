class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    if @user = User.find_by(name: params[:user][:name])
      @user.authenticate(params[:user][:password])
      return redirect_to '/users/new' unless @user

      session[:user_id] = @user.id
      redirect_to user_path(@user)
    end
  end

  def destroy
    reset_session
    redirect_to root_url
  end
end
