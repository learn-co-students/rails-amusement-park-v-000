class RidesController < ApplicationController
  before_action :set_ride, only: [:show, :edit, :update, :destroy]

  # GET /rides
  def index
    @rides = Ride.all
  end

  # GET /rides/1
  def show
  end

  # GET /rides/new
  def new
    @ride = Ride.new
  end

  # GET /rides/1/edit
  def edit
  end

  # POST /rides
  def create
    ride = Ride.new(user_id: current_user.id, attraction_id: params[:attraction_id])
    if ride.save
      ride.take_ride
      redirect_to user_path(current_user)
    else
      redirect_to attraction_path(attraction), notice: "#{ride.attraction.name} was not ridden."
    end
  end

  # PATCH/PUT /rides/1
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

  # DELETE /rides/1
  def destroy
    @ride.destroy
    respond_to do |format|
      format.html { redirect_to rides_url, notice: 'Ride was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ride
      @ride = Ride.find_by(id: params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ride_params
      params.fetch(:ride, {})
    end
end
