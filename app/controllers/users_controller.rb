class UsersController<ApplicationController
  before_action :authentication_required, only: [:show]

  def new
    @user = User.new
  end

  def create
    user = User.create(user_params)
    session[:user_id] = user.id
    redirect_to user_path(user)
  end

  def show
    @user = user
  end

  def ride
    attraction = Attraction.find(params[:attraction][:id])
    ride = Ride.create(attraction_id: attraction.id, user_id: user.id)
    message = ride.take_ride
    flash[:notice] = message
    redirect_to user_path(user)
  end
  #shouldve put this in a ride controller as new action 

  private
    def user_params
      params.require(:user).permit(:name, :password, :nausea, :happiness, :tickets, :height, :admin)
    end

    def user
      @user ||= User.find(params[:id])
    end

end
