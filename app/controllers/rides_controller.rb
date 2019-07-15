class RidesController < ApplicationController

    def new
    end

    def create
        @user = User.find(session[:user_id])
        redirect_to user_path(@user)
    end



end