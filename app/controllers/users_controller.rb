require 'pry'

class UsersController < ApplicationController
   before_action :authenticate_user, only: [:show, :edit, :update, :destroy]

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
    set_user
  #  @message = params[:message] if params[:message]
  #  @message ||= false
    end


    def edit
    end

    def update
      set_user
      if @user.update(user_params)
        redirect_to user_path(@user)
      else
        render :edit
      end
    end

    private

  #  def set_admin
  #    @admin = create_standard_and_admin_user
  #  end

    def set_user
      @user = User.find_by(id: params[:id])
    end

    def user_params
      params.require(:user).permit(
        :name,
        :nausea,
        :happiness,
        :height,
        :tickets,
        :password,
        :admin
        )
    end


end
