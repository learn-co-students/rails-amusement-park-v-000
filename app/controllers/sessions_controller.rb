class SessionsController < ApplicationController
  def new
    @user = User.new

  end

  def create
    #binding.pry
    @user = User.find_by(name: params[:user][:name])
    if @user
    session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def destroy
    session.delete :user_id
  end

end
