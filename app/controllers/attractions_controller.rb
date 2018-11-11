class AttractionsController < ApplicationController
  before_action :set_user

  def index
    @attractions = Attraction.all
  end

  def show
    @attraction = Attraction.find_by(id: params[:id])
  end

  def new
    @attraction = Attraction.new
  end

  def create
    @attraction = Attraction.new(attraction_params)
    @attraction.save
    redirect_to attraction_path(@attraction)
  end

  def edit
    @attraction = Attraction.find(params[:id])
  end

  def update
    @attraction = Attraction.find(params[:id])
    if @attraction.update(attraction_params)
      redirect_to attraction_path(@attraction), notice: 'Attraction was successfully updated.'
    else
      render :edit
    end
  end
end

private
  def set_user
    @user = User.find(session[:user_id])
  end

  def attraction_params
    params.require(:attraction).permit(
      :name,
      :nausea_rating,
      :happiness_rating,
      :tickets,
      :min_height
    )
  end
# has titles of the rides on the attractions index page (FAILED - 4)
#  has links on the attractions index page to the attractions' show pages (FAILED - 5)
#  links from the attractions index pa
