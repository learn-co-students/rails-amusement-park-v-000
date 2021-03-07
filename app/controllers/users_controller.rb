class UsersController < ApplicationController
    before_action :set_user, only: [:show, :update, :edit, :destroy]
    def new
        @user = User.new
    end

    def show
        redirect_to root_path if !logged_in?
    end

    def create
        @user = User.create(user_params)
        if @user && @user.save
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            redirect_to new_user_path(@user)
        end
    end

    def update
        binding.pry
    end

    private

    def user_params
        params.require(:user).permit(:name, :height, :happiness, :nausea, :tickets, :password, :admin)
    end

    def set_user
        @user = User.find(params[:id])
    end
end
