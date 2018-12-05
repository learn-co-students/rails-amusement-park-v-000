class SessionsController < ApplicationController #need flash to display error messages

  def destroy
    session.delete :user_id
    @user = nil
    redirect_to root_url
  end

  def new
    @user = User.new
    @users = User.all
  end

  def create
    @users = User.all
    @user = User.find_by(id: params[:user][:id])
    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to user_path(@user)
      flash[:danger] = 'You have signed in.'
      # Log the user in and redirect to the user's show page.
    else
      #binding.pry
      flash[:danger] = 'Invalid email/password combination' # Not quite right!
      redirect_to root_url
    end
  end
end
