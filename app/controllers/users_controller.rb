class UsersController < ApplicationController
    before_action :set_user, only: [:show, :edit, :update]

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            redirect_to @user
        else
            render :new
        end
    end

    def edit
    end

    def update
        @user.assign_attributes(user_params)
        if @user.save
            redirect_to @user
        else
            render :edit
        end
    end

    def show
      if !session[:user_id]
        redirect_to root_path
      else
         @user = User.find(params[:id])
      end
    end

    private

    def user_params
        params.require(:user).permit(:name, :password, :height, :happiness, :nausea, :tickets, :admin)
    end

    def set_user
        @user = User.find(params[:id])
    end
end
