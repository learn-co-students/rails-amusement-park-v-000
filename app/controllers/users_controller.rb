class UsersController < ApplicationController
    def new
         @user = User.new
    end


    def create
        #  binding.pry
          @user = User.new(strong_params(params))
          if @user.save
              session[:user_id] = @user.id
              redirect_to user_path(@user) #redirect_to root and set session?
          else
              render :new
          end
    end

    def show
        @user = User.find_by(:id => params[:id])
        # binding.pry
    end

    private

    def strong_params(params)
        params.require(:user).permit(:name, :height, :happiness, :nausea, :tickets, :password)
    end

end
