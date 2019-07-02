class AttractionsController < ApplicationController

  def index
    @attractions = Attraction.all
    render 'attractions/index'
  end

  def new

  end

  def create
    @attraction = Attraction.new(attraction_params)

    if @attraction.save
      redirect_to @attraction
    else
      render :new
    end
  end

  def show
    @attraction = Attraction.find(params[:id])
    @user = User.find_by(id: session[:user_id])
  end

  def edit
    
  end

  def update
    
  end

  def destroy
    
  end

  private

  def attraction_params
    params.require(:attraction).permit(:name, :tickets, :happiness_rating, :min_height, :tickets, :height, :nausea_rating)
  end
end
