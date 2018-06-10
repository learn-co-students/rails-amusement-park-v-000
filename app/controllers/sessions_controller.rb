class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = User.find_by(name: params[:user][:name])
    if user && user.authenticate(params[:user][:password])
      # Log the user in and redirect to the user's show page
      session[:user_id] = user.id
      redirect_to user
    else
      # Create an error message
      render 'new'
    end
  end

  def destroy
    session.destroy
    redirect_to root_path
  end
end
