class SessionsController < ApplicationController
  def new
    # if User.find_by(id: session[:user_id])
    #   redirect_to user_path
    # else
    #   render :new
    # end
  end

  def create
    # binding.pry
    @user = User.find_by(name: params[:user_name])
    if @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      redirect_to root_path
    end
  end

  def destroy
    session.delete :user_id
    redirect_to '/'
  end


  # def show
  #   binding.pry
  #   @user = User.find_by(id: params[:id])
  #   if session[:user_id].blank?
  #     redirect_to root_path
  #   end
  # end

end
