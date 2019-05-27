class UsersController < ApplicationController
    def new
        @user = User.new
    end

    def show
        return new_user_path unless session.include? :user_id
        @user = User.find_by(:id => params[:id])
    end

    def create
        @user = User.create(user_params)
        session[:user_id] = @user.id
        redirect_to user_path(@user)
    end

    private
    def user_params
        params.require(:user).permit(:name, :password, :happiness, :nausea, :height, :tickets, :admin)
    end
end