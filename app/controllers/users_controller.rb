class UsersController < ApplicationController
    before_action :require_login, only: :show
    

    PERMISSIONS = {
        :admin => 1,
        :non_admin => 0
    }

    def new 
     @user = User.new
    end
    
    def create
        @user = User.create(user_params)
        if @user.save 
            log_in(@user)
            redirect_to @user
        else 
            @user.errors.full_messages.inspect
            render :new
    
        end 
    end 

    def show 
        @user = User.find(params[:id])
    end 

    def edit 
        @attraction = Attraction.find(params[:attraction])
        @user = User.find(params[:id])
        @ride = Ride.create(user_id: @user.id, attraction_id: @attraction.id)

        @ride.take_ride 
        

        redirect_to user_path(@user)      
    end 

private 
    def user_params
        params.require(:user).permit(:name, :height, :happiness, :nausea, :tickets, :admin, :password)
    end    
    
    def require_login
        unless logged_in?
          redirect_to '/'
        end
      end
    
   
    
end
