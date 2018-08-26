class UsersController < ApplicationController
    skip_before_action :verify_user_is_authenticated, only: [:new,:create]
    def new
      @user = User.new
    end

    def create
      if (user = User.create user_params)
        session[:user_id] = user.id
        redirect_to user_path(user)
      else
        render 'new'
      end
    end

    def show
      @user = User.find_by(id:params[:id])
    end

    def logout
      session.clear
      redirect_to '/home'
    end

    private
    def user_params
      params.require(:user).permit(
        :name,
        :height,
        :height,
        :nausea,
        :tickets,
        :admin,
        :admin,
        :password,
        :happiness
        )
    end
  end
