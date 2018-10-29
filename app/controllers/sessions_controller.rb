class SessionsController < ApplicationController

  # def sign_in
  #   @user = User.new
  # end
  #
  # def create
  #   @user = User.find_by(name: session_params[:user_name])
  #   if @user && @user.authenticate(session_params[:password])
  #     session[:user_id] = @user.id
  #     redirect_to user_path(@user)
  #   else
  #     render 'sign_in'
  #   end
  # end
  #
  # def destroy
  #   session.delete("user_id")
  #   redirect_to root_path
  # end
  #
  # private
  #
  #   def session_params
  #     params.permit(:user_name, :password)
  #   end

  def new
    @user = User.new
  end

   def create
    @user = User.find_by(name: params[:user][:name])
    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      redirect_to '/'
    end
  end
  
   def destroy
    session.destroy
    redirect_to root_path
  end


end
