class SessionsController < ApplicationController
  def new
    @users = User.all
    # Don't render sessions/new if the user is ALREADY logged in.
  end

  def create
    @user = User.find_by(name: params[:user][:name])

    if @user.try(:authenticate, params[:password]) # Looks for nil users and incorrect passwords
      # I could separate this to have two separate errors: one for nil users, and one for invalid passwords.

      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      # Update to the problem below: Try using the "local: true" option in #form_with. Rendering with a flash message should then work.

      flash[:error] = "Username and/or password are incorrect."
      redirect_to signin_path
      # For some reason, that flash[:error] won't show up if I use #render instead of #redirect_to.
      # (Note: This is occurring before I have a drop-down list of usernames. It would probably occur after that, too.)
      
      # flash.now[:alert] = "Invalid username and/or password"
      # render :new
    end
  end

  def destroy
  end
end
