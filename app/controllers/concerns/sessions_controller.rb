class SessionsController < ApplicationController
  def new #login
    @user = User.new
  end

  def create #login
    @user = User.find_by(name: params[:user_name])
    if @user.save
      session[:user_id] = @user.id
      redirect_to @user
    else
      render :new
    end
  end

  def destroy
    session.delete :user_id
    redirect_to '/'
  end
end
