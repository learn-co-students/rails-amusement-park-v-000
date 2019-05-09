class SessionsController < ApplicationController

    def new
        @user = User.new
        @users = User.all
    end

    def create
        @user = User.find_by(id: params[:id])
        
    end
end