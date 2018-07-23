class AttractionsController <ApplicationController
  before_action :find_attraction, only: [:show, :edit, :update]

  def index
    @attractions = Attraction.all
    @user= current_user
  end

  def show
    @user = current_user
    @attraction = Attraction.find_by(id: params[:id])
  end

  def ride
    ride = Ride.new

    ride.user = current_user
    ride.attraction = Attraction.find_by(id: params[:attraction_id])
    ride.save
    flash[:message] = ride.take_ride
    redirect_to user_path(current_user)
  end

  def new
    @attraction = Attraction.new
  end

  def create
    attraction = Attraction.new(attraction_params)

    if attraction.save
      redirect_to attraction_path(attraction)
    else
      redirect_to new_attraction_path
    end
  end

  def edit

  end

  def update
    @attraction.update(attraction_params)
    redirect_to attraction_path(@attraction)
  end

  private

  def attraction_params
    params.require(:attraction).permit(:name, :tickets, :nausea_rating, :happiness_rating, :min_height)
  end

  def find_attraction
    @attraction = Attraction.find_by(id: params[:id])
  end
end
