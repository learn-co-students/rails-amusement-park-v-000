class UsersController < ApplicationController
    before_action :require_login, only: [:show, :edit, :update]

    def new
        @user = User.new
    end

    def create
        @user = User.create(user_params)
        return redirect_to '/new' unless @user.save
        session[:user_id] = @user.id
        redirect_to user_path(@user)
    end

    def show
        @message = params[:message] if params[:message]
        @user = User.find(params[:id])
    end

    def edit
        @user = User.find(params[:id])
    end

    private

    def user_params
        params.require(:user).permit(:name, :height, :happiness, :nausea, :tickets, :password, :admin)
    end

    def require_login
        unless logged_in?
          redirect_to root_path
        end
    end

end