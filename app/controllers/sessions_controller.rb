class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def welcome
    session.delete :user_id
  end

  def destroy
    binding.pry
    session.delete :user_id
    redirect_to '/'
  end

  def find
    #binding.pry
    @user = User.find(params[:user][:name])
    #binding.pry
    if @user.authenticate(params[:user][:password])
      #binding.pry
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      #binding.pry
      redirect_to controller: 'sessions', action: 'new'
    end
  end

end
