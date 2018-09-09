class SessionsController < ApplicationController

  def create
    user = User.find(params[:user][:name])
    user.try(:authenticate, params[:password])
    render :new unless user

    session[:user_id] = user.id
    redirect_to user_path(current_user)

    # if @user && @user.authenticate(params[:user][:password])
    #   session[:user_id] = @user.id
    #   redirect_to user_path(@user)
    # else
    #   flash[:alert] = @user.errors.full_messages.join(", ")
    #   render :new
    # end
  end

  def destroy
    session.delete :user_id
    redirect_to root_path
  end

end
