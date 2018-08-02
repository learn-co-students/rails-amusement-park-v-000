class UsersController < ApplicationController
    def new
         @user = User.new
    end


    def create
         binding.pry
        #  @user = User.create()
         #set session hash once use is created
    end

    def show
        binding.pry
    end

    private

    def strong_params
        params.require(:user).permit(:name, :height, :happiness, :nausea, :tickets, :password)
    end

end
