class UsersController < ApplicationController
    
    def new
      @user = User.new
      
    end

    def create
      @user = User.create(user_params)
      #return redirect_to controller: 'users', action: 'new' unless @user.save
      if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
      else
        redirect_to '/'
      end
  end


    def show
   
      if current_user
      @user = User.find(params[:id])
      else
        redirect_to '/'
      end
    end

    private
     
    def user_params
      params.require(:user).permit(:name, :password, :nausea, :happiness, :tickets, :height, :admin)
    end
    
  end