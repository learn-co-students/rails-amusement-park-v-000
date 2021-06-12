class UsersController < ApplicationController
   # skip_before_action :verified_user, only: [:new, :create]
  
    def new
        @user = User.new
    end
  
    def create
        if (user = User.create(user_params))
            session[:user_id] = user.id
            redirect_to user_path(user)
        else
            render 'new'
        end
    end

    def update
        @user = User.find_by(id: params[:id])
\
    end 

  


    def signin
        @users = User.all
    end
    
    def newsignin
        #raise params.inspect
        @user = User.find_by(name: params[:user][:name])
        if @user == nil
            redirect_to '/signin'
        else
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        end
    end


    def signout
        session.delete("user_id")
        redirect_to root_path
    end
  
    def show
        @user = User.find_by(id: params[:id])
        if current_user != @user
            redirect_to '/'
        end

    end
  
    private
  
    def user_params
      params.require(:user).permit(
        :name,
        :height,
        :nausea,
        :tickets,
        :admin,
        :password,
        :happiness
      )
    end


    
end