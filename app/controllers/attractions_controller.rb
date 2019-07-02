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
    @attraction = Attraction.find(params[:id])
  end

  def update
    @attraction = Attraction.find(params[:id])
    @attraction.update(name: attraction_params[:name], tickets: attraction_params[:tickets], happiness_rating: attraction_params[:happiness_rating], min_height: attraction_params[:min_height], nausea_rating: attraction_params[:nausea_rating])

    if @attraction.save
      redirect_to @attraction
    else
      render :edit
    end
  end

  def destroy
    
  end

  private

  def attraction_params
    params.require(:attraction).permit(:id, :name, :tickets, :happiness_rating, :min_height,  :nausea_rating)
  end
end
