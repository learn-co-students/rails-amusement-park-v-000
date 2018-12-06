class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
    if @user.save
      # woo saving
    else
      render 'new'
    end
  end

  private

    def user_params
      params.require(:name, :password, :nausea, :happiness, :tickets, :height)
    end

end # class UsersController
