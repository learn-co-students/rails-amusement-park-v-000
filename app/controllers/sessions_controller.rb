class SessionsController < ApplicationController

  def sign_in
    @user = User.new #render login form
  end

  def create
    @user = User.find_by(name: params[:user][:name])

    if @user && @user.authenticate(params[:user][:password])
    # raise params.inspect
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      render 'sign_in'
    end
  end

  def destroy
    reset_session
    redirect_to signin_path
  end

end
