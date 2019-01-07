class StaticController < ApplicationController

  def home
  end

  def signin
    @user_names = User.all.map{|u| u.name}
  end

  def login
    @user = User.find_by(name: params[:user_name], password: params[:password])
    if @user
      session[:user_id] = @user.id
      redirect_to user_path @user
    else
      render :login
    end
  end

  def logout
    session.delete(:user_id) if session[:user_id]
    redirect_to root_url
  end
end
