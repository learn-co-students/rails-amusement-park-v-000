class UsersController < ApplicationController

    def new
        @user = User.new
    end

    def create
        @user = User.create(user_params)

        if @user
            session[:user_id] = @user.user_id
            redirect_to user_path(@user)
        else
            render 'new'
        end
    end

    def user_params
        params.require(:user).permit(
            :name,
            :nausea,
            :happiness,
            :tickets,
            :height,
            :password,
            :admin
        )
    end

end
