class UsersController < ApplicationController

    before_action :require_login, except: [:new, :create]


    def new
        @user=User.new
    end

    def create
        @user=User.new(user_params)
        @user.save
        if @user.valid?
            session[:user_id]=@user.id
            redirect_to user_path(@user)
        else
            render :new
        end
    end

    def show
        @user = User.find_by(:id => params[:id])
    end


    private

    def user_params
        params.require(:user).permit(:name, :password, :height, :tickets, :happiness, :nausea, :admin)
    end

end
