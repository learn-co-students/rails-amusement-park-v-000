class AttractionsController < ApplicationController

  def ride
    @attraction = Attraction.find(params.require(:ride).permit(:attraction_id)[:attraction_id])
    @ride = Ride.new(attraction: @attraction, user: current_user)

    if @ride.take_ride_or_log_error
      #it generated an error message
      redirect_to user_path(current_user), flash: {notice: @ride.errors[:ride_errors].first}
    else
      @ride.save
      redirect_to user_path(current_user), flash: {notice: "Thanks for riding the #{@ride.attraction.name}!"}
    end
  end

  def index
    @attractions = Attraction.all
  end

  def show
    @attraction = Attraction.find_by(id: params[:id])
  end

  def new
    if current_user.admin
      @attraction = Attraction.new
      render :new
    else
      redirect_to root_path
    end
  end

  def create
    if current_user.admin
      @attraction = Attraction.new(attraction_params)
      if @attraction.save
        redirect_to attraction_path(@attraction)
      else
        render :new
      end
    else
      #no admin? no go here
      redirect_to root_path
    end
  end

  def edit
    if current_user.admin
      @attraction = Attraction.find_by(id: params[:id])
      render :edit
    else
      #no admin? no go here
      redirect_to root_path
    end
  end

  def update
    if current_user.admin
      @attraction = Attraction.find_by(id: params[:id])
      @attraction.update(attraction_params)
      if @attraction.save
        redirect_to attraction_path(@attraction)
      else
        render :edit
      end
    else
      #no admin? no go here
      redirect_to root_path
    end
  end
  
  def destroy
    if current_user.admin
      @attraction = Attraction.find_by(id: params[:id])
      @attraction.destroy
      redirect_to attractions_path
    end
  end

  private

  def attraction_params
    params.require(:attraction).permit(:name, :tickets, :min_height, :nausea_rating, :happiness_rating)
  end
end
