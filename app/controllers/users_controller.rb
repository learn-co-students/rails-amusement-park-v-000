class UsersController < ApplicationController
  def new
    
  end

  def create
    # binding.pry
    @user = User.create(user_params)
    session[:user_id] = @user.id
    redirect_to user_path(@user)
  end

  def show
    # binding.pry
    @user = User.find(params[:id])
    if @user != current_user       
      redirect_to root_path      
    end   
  end

  def update
    @user = current_user
    @attraction = Attraction.find(params[:attraction_id])
    ride = Ride.create(user_id: params[:id], attraction_id: params[:attraction_id])   
    # binding.pry 
    redirect_to user_path(@current_user)
  end

  private

  def other_params
    params.permit(:id, :attraction_id)
  end

  def user_params
    params.require(:user).permit(
      :name,
      :height,
      :happiness,
      :nausea,
      :tickets,
      :password,
      :admin
    )
  end
end
