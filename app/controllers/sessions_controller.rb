class SessionsController < ApplicationController

  def new
  end

  def create

    if params[:user].blank? || params[:password].blank?
      redirect_to '/signin'
    else
      @user=User.find_by(name: params[:user][:name])
      if @user.authenticate(params[:password])
        session[:user_id]=@user.id
        redirect_to user_path(@user)
      else
        redirect_to '/signin'
      end
    end
  end

  def destroy
    session.delete :user_id
    redirect_to '/'
  end

end
