class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.find_by(:id => params[:user][:id])
                if @user && @user.authenticate(params[:user][:password])
                    session[:user_id] = @user.id

                    redirect_to user_path(@user)
                else
                        render 'sessions/new' 
                end
  end

  def destroy
    session[:user_id] = nil
    reset_session
      redirect_to root_path
  end


  private
  def user_params
    params.require(:user).permit(:name, :height, :nausea, :happiness, :tickets, :password, :admin)
  
    end

end
