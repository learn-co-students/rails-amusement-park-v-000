class SessionsController < ApplicationController

  def sign_in
    @user = User.new(name: params[:name])
  end

  def create
    @user = User.find_by(name: params[:user][:name])
# binding.pry
    if @user && @user.authenticate(params[:user][:password])

      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      render 'sign_in'
    end
  end

  def destroy
    session.delete(:user_id)
    # @current_user = nil
    redirect_to root_path

  end

# can include a session_params to permit the user and require name and password
end
