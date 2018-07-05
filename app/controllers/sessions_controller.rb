class SessionsController < ApplicationController

  def signin
    @user = User.new
  end

  def create
    @user = User.find_by(name: params[:user][:name])
    # binding.pry
    if  @user.authenticate(params[:password])
      session[:user_id] = @user.id
       # @user.save
      redirect_to user_path(@user)
    # elsif !@user.exists?
    #   redirect_to new_user_path

  else #current_user != @user
    redirect_to root_path
  # else
  #      redirect_to signin_path

    end
  end

  def destroy
    # render :'/application/hello'
    session.delete :user_id
    redirect_to root_path
  end

  private

end
