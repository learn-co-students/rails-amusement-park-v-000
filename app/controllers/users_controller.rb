require 'pry'
class UsersController < ApplicationController 
    before_action :require_login, only: [:show, :edit, :update, :destroy]

    def new
        @user = User.new
    end

    def create
        @user = User.create(user_params)
        if @user
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            redirect :new
        end
    end

    def show
        @user = User.find(params[:id])
    end

    def edit
    end

    def update
    end

    def destroy
        session[:user_id] = nil  
        redirect_to login_path
    end

    private

    def user_params
        params.require(:user).permit(:name, 
                                     :height, 
                                     :happiness, 
                                     :nausea, 
                                     :password, 
                                     :tickets,
                                     :admin)
    end


    #<ActionController::Parameters {"utf8"=>"✓", 
    #"authenticity_token"=>"bT6hHIJNfetkTgovozMsYPaLo9dRJCLpR-t-O101LQMoy25pLZvK38ULxA4-UxMei6mbvM3vdGFpy1t0XyHRkQ", 
    #"user"=>{"name"=>"buffy", 
    #"height"=>"30", "happiness"=>"5", 
    #"nausea"=>"5", "tickets"=>"5", 
    #"password"=>"buffylover", 
    #"admin"=>"1"}, "commit"=>"Create User", 
    #"controller"=>"users", "action"=>"create"} permitted: false>

end