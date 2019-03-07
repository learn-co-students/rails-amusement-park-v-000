class SessionsController < ApplicationController


  def new
    @user = User.new
    # if logged_in?
    #   @user = current_user
    #   redirect_to user_path(@user)
    # end

  end


  def create
    
    @user = User.find_by(name: params[:user][:name])

    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      redirect_to new_user_path
    end
  end

  def destroy
    session.destroy
    redirect_to login_path
  end




  end
