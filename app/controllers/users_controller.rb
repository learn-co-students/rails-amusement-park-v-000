class UsersController < ApplicationController
    skip_before_action :verified_user, only: [:new, :create]
    
    def new
        @user = User.new
    end

    def create
        @user = User.create(user_params)

        if @user.save
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            render 'new'
        end
    end

    def show
        @user = current_user
        render 'show'
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
