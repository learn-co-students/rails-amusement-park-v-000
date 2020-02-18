class UsersController < ApplicationController
  #  before_action :authenticate_user, only: [:show]

    def new 
    @user = User.new
    end
    
    def create
      #  raise params.inspect
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            render 'new'
        end
    end

    def show
        @user = User.find_by(id: params[:id])
   #     if !current.user.admin
            if current_user != @user
            redirect_to root_path
            end
     #   end
    end
    

    private
    def user_params
        params.require(:user).permit(:name, :password, :height, :nausea, :happiness, :tickets, :admin)
    end
end
