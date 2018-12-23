class UsersController < ApplicationController
    before_action :set_user, only: [:show, :edit, :update, :destroy]
    
    def show
        @message = params[:message] if params[:message]
        @message ||= false
   end

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)

        if @user.save
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            redirect_to new_user_path
        end
    end

   def edit
   end

   def update
    
        @user = User.find(params[:id])
        if @user.update(user_params)
            redirect_to @user, notice: "User was successfully updated"
        else
            redirect_to edit_user(@user)
        end
   end

    private

        def user_params
            params.require(:user).permit(:name, :height, :happiness, :tickets, :nausea, :password, :admin)
        end

        def set_user
            @user = User.find(params[:id])
        end

end