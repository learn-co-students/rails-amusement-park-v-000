class AttractionsController < ApplicationController
  before_action :authentication_required

  def index
    @attractions = Attraction.all
  end

  def new
    @attraction = Attraction.new
  end

  def create
    @attraction = Attraction.new(attraction_params(:name, :min_height, :happiness_rating, :nausea_rating, :tickets))
    if @attraction.save
      redirect_to attraction_path(@attraction.id)
    else
      render :new
    end
  end

  def show
    @attraction = Attraction.find(params[:id])
    @ride = Ride.new
  end

  def edit
    @attraction = Attraction.find(params[:id])
  end

  def update
    @attraction = Attraction.find(params[:id])
    @attraction.update(attraction_params(:name, :min_height, :happiness_rating, :nausea_rating, :tickets))
    @attraction.save
    redirect_to attraction_path(@attraction)

  end
  

  def ride
    @ride = Ride.new(ride_params(:attraction_id, :user_id))
    if (@ride.user.tickets < @ride.attraction.tickets) || (@ride.user.height < @ride.attraction.min_height)
      flash[:message] = []
      flash[:message] << "You do not have enough tickets to ride the #{@ride.attraction.name}" if @ride.user.tickets < @ride.attraction.tickets
      flash[:message] << "You are not tall enough to ride the #{@ride.attraction.name}" if @ride.user.height < @ride.attraction.min_height
    else
      @ride.user.tickets -= @ride.attraction.tickets
      @ride.user.nausea += @ride.attraction.nausea_rating
      if @ride.user.nausea > 5
        @ride.user.nausea = 5
      end
      if @ride.user.happiness < 5
        @ride.user.happiness += @ride.attraction.happiness_rating
      end
      @ride.save
      @ride.user.save
      flash[:message] = ["Thanks for riding the #{@ride.attraction.name}!"]
    end
    redirect_to user_path(@ride.user)
  end

  private

  def attraction_params(*args)
    params.require(:attraction).permit(*args)
  end

  def ride_params(*args)
    params.require(:ride).permit(*args)
  end


end
