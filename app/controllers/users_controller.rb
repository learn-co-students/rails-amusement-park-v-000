class UsersController < ApplicationController
    before_action :confirm_logged_in, only: [:show]

    def new
        @user = User.new
    end
    
    def create
        @user = User.new(user_params)
        if @user.valid?
            @user.save
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            render :new
            flash[:notice] = "Please fill out all fields"
        end
    end

    def show
        @message = params[:message] if params[:message]
        @message ||= false
        @user = User.find(params[:id])
    end


    private 
        def user_params
            params.require(:user).permit(:name, :height, :happiness, :nausea, :tickets, :password, :admin)
        end 

        def confirm_logged_in
            redirect_to root_path unless session.include? :user_id
        end
end
