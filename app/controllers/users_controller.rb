class UsersController < ApplicationController
skip_before_action :redirect_if_not_logged_in, only: [:new, :create]
    def new
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

    def show
    end

    def update
    end

    private

    def user_params
        params.require(:user).permit(:name, :password, :happiness, :nausea, :tickets, :height, :admin)
    end
end
