class UsersController < ApplicationController

    before_action :require_login, except: [:new, :create]
    

    def new
        @user=User.new
    end

    def create
        @user=User.new(user_params)
        binding.pry
        if @user.valid?
            session[:user_id]=@user.id
            binding.pry
            redirect_to user_path(@user)
        else
            render :new
        end
    end

    def show
        binding.pry
        @user = User.find_by(:id => params[:id])
        binding.pry
        # @user=User.find(params[:id])
    end


    private

    def user_params
        params.require(:user).permit(:name, :password, :height, :tickets, :happiness, :nausea, :admin)
    end

end