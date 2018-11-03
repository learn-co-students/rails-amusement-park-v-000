require 'pry'
class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def show
    @message = params[:message]
    @message ||= false
  end

  def new
    @user = User.new
  end

  def create
    #"name"=>"Amy Poehler", "password"=>"password", "height"=>"58", "tickets"=>"15", "happiness"=>"3", "nausea"=>"2"
    @user = User.new(user_params)
      if @user.save
        session[:user_id] = @user.id
        redirect_to user_path(@user)
      else
        render :new
      end
  end

  def edit
  end

  def update
     @user.update(user_params)
     if @user.save
       redirect_to user_path
      else
        render :edit
      end
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(
        :name,
        :password,
        :height,
        :tickets,
        :happiness,
        :nausea,
        :admin
      )
    end
end
