class AttractionsController < ApplicationController
  before_action :require_admin
  skip_before_action :require_admin, only: [:index, :show]

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
    if @attraction.save
      redirect_to attraction_path(@attraction)
    else
      render 'attractions/new'

      #this will render the new page with the form again but will still have the same @attraction. this might have errors on it if validation
      # is implemented. Will need a message displaying the error
    end
  end

  def edit
    @attraction = Attraction.find_by(id: params[:id])
  end

  def update
    @attraction = Attraction.find_by(id: params[:id])
    if @attraction.update(attraction_params)
      render attraction_path(@attraction)
      flash[:message] = "Successfully Updated!"
    else
      flash[:error] = "Update was unsuccessful. Please try again."
      render edit_attraction_path(@attraction)
    end

  end

  private

  def attraction_params
    params.require(:attraction).permit(:name, :tickets, :nausea_rating, :happiness_rating, :min_height)
  end

  def require_admin
    unless admin?
      flash[:error] = "You have to be an admin to access that page."
      redirect_to user_path(current_user)
    end
  end
end