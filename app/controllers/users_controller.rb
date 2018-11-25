class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def show
    if !session[:user_id]
      redirect_to '/'
    else
      @user = User.find(params[:id])
      @message = params[:message] if params[:message]
    end
  end

  private

    def user_params
      params.require('user').permit('name', 'height', 'happiness', 'nausea', 'tickets', 'password', 'admin')
    end

    def logged_in
      !!current_user
    end

end
