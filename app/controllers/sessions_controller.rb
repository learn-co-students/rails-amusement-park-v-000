class SessionsController < ApplicationController
  def new; end

  def create
    @user = User.find(params[:user][:name])

    if @user.authenticate(params[:password])
      session[:user_id] = @user.id

      redirect_to user_path(@user)
    else
      flash[:notice] = "Password is incorrect. Please try again."

      render :new
    end
  end

  def destroy
  end

  private

    def user_params
      params.permit(:name, :password)
    end
end
