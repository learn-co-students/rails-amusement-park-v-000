class AttractionsController < ApplicationController
  before_action :require_login
  helper_method :ride_or_edit

  def index
    @attractions = Attraction.all
  end

  def new
    @attraction = Attraction.new
  end

  def create
    @attraction = Attraction.create(attraction_params)
    render :show
  end

  def show
    @attraction = Attraction.find_by(id: params[:id])
  end

  def update
    @attraction = Attraction.find_by(id: params[:id])
    @attraction.update(attraction_params)
  end

  def ride_or_edit
    if current_user.admin == true
      return "Show #{@attraction.name}"
    else
      return "Go on this ride"
    end
  end


  private

  def require_login
    return head(:forbidden) unless session.include? :user_id
  end

  def attraction_params
    params.require(:attraction).permit(:name, :tickets, :nausea_rating, :happiness_rating, :min_height)
  end

end
