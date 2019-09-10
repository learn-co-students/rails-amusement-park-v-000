class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    find_user
      if @user && @user.authenticate(params[:session][:password])
        session[:user_id] = @user.id
        redirect_to user_path(@user)
      else 
        render 'sessions/new'
      end
  end


  def destroy
    reset_session
    redirect_to '/'
  end

    
  def find_user
    if id = params[:user][:name].to_i
      @user = User.find(id)
    else
      @user = User.find_by_name(params[:user][:name])
    end
  end

  
end
