class RidesController < ApplicationController
  before_action :set_ride, only: [:show, :edit, :update, :destroy]

  def index
    @rides = Ride.all
  end

  def show
  end

  def new
    @ride = Ride.new
  end

  def edit
  end

  def create
    @ride = Ride.new(user_id: current_user.id, attraction_id: params[:attraction_id])
    if @ride.save
      if @ride.user.admin
        redirect_to attraction_path(@ride.attraction)
      else
        redirect_to user_path(current_user), notice: @ride.take_ride
      end
    else
      redirect_to attraction_path(attraction), notice: "#{@ride.attraction.name} was not ridden."
    end
  end

  def update
    respond_to do |format|
      if @ride.update(ride_params)
        format.html { redirect_to @ride, notice: 'Ride was successfully updated.' }
        format.json { render :show, status: :ok, location: @ride }
      else
        format.html { render :edit }
        format.json { render json: @ride.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @ride.destroy
    respond_to do |format|
      format.html { redirect_to rides_url, notice: 'Ride was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_ride
      @ride = Ride.find_by(id: params[:id])
    end

    def ride_params
      params.fetch(:ride, {})
    end
end
