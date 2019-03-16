require 'pry'

class UsersController < ApplicationController
#   before_action :authenticate_user, only: [:show, :edit, :update, :destroy]

#  def index
#    @users = User.all
#  end

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
    return head(:forbidden) unless session.include? :user_id
    @user = User.find(params[:id])
    #  params[:id] = session[:user_id]
    #  session[:user_id] = @user.id
    #  if !current_user.admin
    #    if current_user != @user
  #      redirect_to new_path
  #      end
  #    end
    end

    def update
      @user = User.find(params[:id])
      @user.update(user_params)
      redirect_to user_path(@user)
    end

    private

    def user_params
      params.require(:user).permit(
        :name,
        :nausea,
        :happiness,
        :height,
        :tickets,
        :password,
        :admin)
    end


end
