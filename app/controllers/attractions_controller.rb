class AttractionsController < ApplicationController

  def index
    @attractions = Attraction.all
  end

  def show
    @user = current_user
    @attraction = Attraction.find_by(id: params[:id])
  end

  def new
    @attraction = Attraction.new
  end

  def create
    if current_user.admin == true
      @attraction = Attraction.create(attraction_params)
      return redirect_to 'attractions/new' unless @attraction.save
      redirect_to "/attractions/#{@attraction.id}"
    end
  end

  def edit
    @attraction = Attraction.find(params[:id])
  end
   
  def update
    @attraction = Attraction.find(params[:id])
    @attraction.update(attraction_params)
    redirect_to attraction_path(@attraction)
  end

  private

  def attraction_params
    params.require(:attraction).permit(:name, :min_height, :happiness_rating, :nausea_rating, :tickets)
  end

end
