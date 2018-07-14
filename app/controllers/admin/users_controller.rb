class Admin::UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    if current_user
      render :show
    else
      redirect_to '/'
    end
  end
end
