class SessionsController < ApplicationController

  def new
    @user = User.new #creating an empty user instance for the collection_select
  end

  def create
    @user = User.find_by(name: session_params[:name])
    if @user && @user.authenticate(session_params[:password])
      log_in @user
      redirect_to @user
    else
      #flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end


  def destroy
    log_out
    redirect_to root_url  
  end

  private

    def session_params
      params.require(:user).permit(:name, :password)
    end

end
