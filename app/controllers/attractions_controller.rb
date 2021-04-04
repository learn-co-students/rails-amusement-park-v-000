class AttractionsController < ApplicationController
  before_action :find_attraction, only: [:show, :edit, :update]
  before_action :authentication_required

  def index
    @attractions = Attraction.all
  end

  def show
    # create this instance to use it in the view show, it has already the user and the attraction.
    @ride = @attraction.rides.build(user_id: current_user.id)

  end

  def new
    @attraction = Attraction.new
  end

  def create
  @attraction = Attraction.create(attraction_params)
  
  if @attraction
      redirect_to attraction_path(@attraction)
    else
      render :new
   end
end

 def edit
   @attraction = Attraction.find_by(id: params[:id])
   @ride = @attraction.rides.build(user_id: current_user.id)
 end

  def update
    attraction = Attraction.find_by(id: params[:id])
    attraction.update(attraction_params)
    redirect_to attraction_path(attraction)
  end



  private
  def find_attraction
    @attraction = Attraction.find_by(id: params[:id])
  end

  def attraction_params
    params.require(:attraction).permit(:name, :min_height, :happiness_rating, :nausea_rating, :tickets)
  end
end
