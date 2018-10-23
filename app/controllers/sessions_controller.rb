class SessionsController < ApplicationController
skip_before_action :verify_user_authenticated, only:[:new, :create]
  def new
  end

  def create
    @user = User.find_by(name: params[:user][:name])
    session[:user_id] = @user.id
    redirect_to user_path(@user)

  end


def destroy
  session.delete :user_id
  redirect_to '/'
end 


end
