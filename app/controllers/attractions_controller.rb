class AttractionsController < ApplicationController
  before_action :require_log_in
  before_action :find_attraction, except: [:index, :new, :create]

  def index
    @user = User.find(session[:user_id])
    @attractions = Attraction.all
  end

  def show
    @ride = Ride.new
  end

  def new
    @attraction = Attraction.new
  end

  def create
    @attraction = Attraction.new(attraction_params)
    if @attraction.save
      redirect_to attraction_path(@attraction.id)
    else
      @errors = @attraction.errors
      render "new"
    end
  end

  def edit
  end

  def update
    if @attraction.update(attraction_params)
      redirect_to attraction_path(@attraction)
    else
      @errors = @attraction.errors
      render "edit"
    end
  end

  def destroy
  end

  private

    def find_attraction
      @attraction = Attraction.find(params[:id])
    end

    def attraction_params
      params.require(:attraction).permit(:name, :tickets, :nausea_rating, :happiness_rating, :min_height)
    end

end
