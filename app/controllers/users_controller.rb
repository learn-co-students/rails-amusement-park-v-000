class UsersController < ApplicationController
    # again, this came from solution but totally makes
    # sense; just a matter of determining the vectors
    # of what you are doing (ex. including vs excluding,
    # doing before vs doing after)
    skip_before_action :authenticated_user, only: [:new, :create]

    def new
        @user = User.new
    end

    def create
        if user = User.create(user_params)
            session[:user_id] = user.id
            redirect_to user_path(user)
        else
            render new_user_path
        end
    end

    def show
        @user = current_user
    end

    private

    def user_params
        params.require(:user).permit(:name, :height, :happiness, :nausea, :tickets, :password, :admin)
    end

end