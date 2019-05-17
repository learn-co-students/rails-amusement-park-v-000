
class SessionsController < ApplicationController
  def current_user
      current_user = User.find(session[:user_id])
  end

  def redirect_to_signin
      if !session[:user_id]
          redirect_to '/signin'
      end

      if session[:user_id] != current_user 
          redirect_to '/signin'
      end
  end

  def signin
      @user = User.find(params[:user][:name])
      session[:user_id] = @user.id 
      redirect_to user_path(@user)
  end

  def destroy
      session.delete :user_id
      redirect_to '/'
  end

end 