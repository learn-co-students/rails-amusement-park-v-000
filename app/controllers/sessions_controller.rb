class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    if @user = User.find_by(id: params[:user][:name])
      if @user.password == params[:user][:password]
        session[:user_id] = @user.id
        redirect_to user_path(@user)
      end
    else
      redirect_to '/signin'
    end
  end

  def destroy
    binding.pry
    session.destroy
    redirect_to '/'
  end
end
