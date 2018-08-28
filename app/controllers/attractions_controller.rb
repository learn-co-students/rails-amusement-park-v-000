class AttractionsController < ApplicationController

  def index
    @attractions = Attraction.all
    @user = current_user
  end

  def new
    @attraction = Attraction.new
    render :new
  end

  def create
    @attraction = Attraction.new(attraction_params)
    @attraction.save

    redirect_to attraction_path(@attraction)
  end

  def show
    @attraction = Attraction.find_by(id: params[:id])
    @user = User.find_by(id: current_user.id)

    if @attraction
      render :show
    else
      redirect_to root_path
    end
  end

  def edit
    @attraction = Attraction.find_by(id: params[:id])
    @user = User.find_by(id: current_user.id)

    if current_user.admin
      render :edit
    else
      redirect_to root_path
    end
  end

  def update
    @attraction = @attraction.update(attraction_params)
    @attraction.save
  end

  private

  def attraction_params
    params.require(:attraction).permit(:name, :tickets, :nausea_rating, :happiness_rating, :min_height)
  end
end
