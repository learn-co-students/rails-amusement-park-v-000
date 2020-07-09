class UsersController < ApplicationController
   before_action :require_login, except: [:new, :create]

  def new 
    @user = User.new
  end 
    
    def create 
        @user = User.create(user_params)
        # binding.pry 
        if @user.valid?
        session[:user_id] = @user.id
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
      params.require(:user).permit(:name, :password, :nausea, :happiness, :tickets, :height, :admin)
    end 
end 