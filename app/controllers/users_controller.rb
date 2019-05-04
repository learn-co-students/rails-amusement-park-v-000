class UsersController < ApplicationController

  def new 
    @user = User.new
  end 
    
    def create 
        @user = User.create(user_params)
        # binding.pry 
        session[:user_id] = @user.id
    end 
    
    # User.create(
    #     :name => "Mindy",
    #     :password => "password",
    #     :nausea => 5,
    #     :happiness => 3,
    #     :tickets => 4,
    #     :height => 34
    #   )

    def show 
      @user = User.find_by(:id => params[:id])
    end 


      private 

    def user_params
      params.require(:user).permit(:name, :password, :nausea, :happiness, :tickets, :height)
    end 
end 