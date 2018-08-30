class AttractionsController < ApplicationController
  def index
    @attractions = Attraction.all
    @user = User.find(session[:user_id])
  end

  def show
    @attraction = Attraction.find(params[:id])
  end

  def new
    @attraction = Attraction.new
  end

  def create
    @attraction = Attraction.new(attraction_params)

    if @attraction.save
      redirect_to @attraction
    else
      render :new
    end
  end

  def edit
    @attraction = Attraction.find(params[:id])
  end

  def update
    @attraction = Attraction.find(params[:id])

    @attraction.update(attraction_params)

    if @attraction.save
      redirect_to @attraction
    else
      render :edit
    end
  end

  def destroy
    @attraction = Attraction.find(params[:id])
    @attraction.destroy
    flash[:notice] = "Attraction deleted."
    redirect_to attractions_path
  end

  private

  def attraction_params
    params.require(:attraction).permit(:name, :tickets, :nausea_rating, :happiness_rating, :min_height)
  end
end
