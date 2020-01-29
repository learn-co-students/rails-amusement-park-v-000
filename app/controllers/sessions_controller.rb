class SessionsController < ApplicationController
  def new
    # @users = User.all
    # Remember: @users doesn't exist in the #create method, 
    # so I need to use User.all instead of @users in #collection_select so that I can re-render :new.

    # Don't render sessions/new if the user is ALREADY logged in.
  end

  def create
    @user = User.find_by(name: params[:user][:name])

    # if @user.try(:authenticate, params[:password]) # Looks for nil users and incorrect passwords
      # The line of code above is needed if (in the new.html.erb file) I use #form_with without a model.
  
    if @user.try(:authenticate, params[:user][:password])
      # I could separate this to have two separate errors: one for nil users, and one for invalid passwords.
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      flash.now[:alert] = "Invalid username and/or password" # flash[:error] works, too
      render :new

      # Update to the problem below: Try using the "local: true" option in #form_with. Rendering with a flash message should then work.
      # flash[:error] = "Username and/or password are incorrect."
      # redirect_to signin_path
      # For some reason, that flash[:error] won't show up if I use #render instead of #redirect_to.
      # (Note: This is occurring before I have a drop-down list of usernames. It would probably occur after that, too.)
    end
  end

  def destroy
  end
end
