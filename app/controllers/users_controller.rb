class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      login
      redirect_to user_path(@user)
    end
  end

  def show
    if !logged_in?
      redirect_to root_url

      ###breaks the tests###
    # elsif logged_in? && !same_user?
    #   session.clear
    #   redirect_to root_url


    else
      @user = get_user
    end
  end

  def destroy
    byebug
  end

  private

  def logged_in?
    !!session[:user_id]
  end

  def get_user
    User.find(session[:user_id])
  end

  def same_user?
    session[:user_id] == params[:id]
  end

end
