require 'pry'
class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
  
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user.save
      redirect_to @user
    else
      render :new
    end
  end

  def show
    
  end

  def edit
    
  end

  def update

  end

  def destroy
  
  end

  private
  
    def user_params
      params.require(:user).permit(:name, :password, :height, :happiness, :nausea, :tickets)
    end

    def set_user
      @user = User.find_by(params[:id])
    end
end
