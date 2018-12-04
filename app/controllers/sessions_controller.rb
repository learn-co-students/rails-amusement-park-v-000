class SessionsController < ApplicationController
  def login
    @users = User.all
  end

  def create
    if (user = User.find_by(user_params(:id)))
      if user.authenticate(params[:user][:password])
        session[:user_id] = user.id
        flash[:message] = "Welcome, #{user.name}"
        redirect_to user_path(user)
      else
        flash[:message] = "Improper Credentials Entered"
        @users = User.all
        render 'login'
      end
    else
      flash[:message] = "User not found"
      @users = User.all
      render 'login'
    end
  end

  def logout
    session.delete :user_id
    redirect_to root_path
  end


  private 

  def user_params(*args)
    params.require(:user).permit(*args)
  end

end
