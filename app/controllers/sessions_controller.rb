class SessionsController < ApplicationController
  def login
    @user = User.new
  end

  def create
    # binding.pry
    @user = User.find_by_name(params[:user][:name])
    if @user
      session[:user_id] = @user.id
      redirect_to @user
    else
      redirect_to signin_path
    end

    def destroy
      # binding.pry
      session.delete :user_id
      redirect_to root_path
    end

  end

  private

end
