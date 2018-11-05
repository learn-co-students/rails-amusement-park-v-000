class AttractionsController < ApplicationController
  
  def index
      @attractions = Attraction.new
      @attractions = Attraction.all
  end

  def show
    #   attraction needs find by  id.
    @attraction = Attraction.find(params[:id])
    render 'attractions/show'
    
  end

  def new
    @attractions = Attraction.new
     render 'attractions/new'
  end

  def create
    @attraction = Attraction.create(attraction_params)
     
    if @attraction.save
      session[:attraction_id] = @attraction.id  
       redirect_to attraction_path(@attraction)
    else
      render 'attractions/new'
    end

  end
 


  private

   def attraction_params
    params.require(:attraction).permit(:name, :min_height, :nausea_rating, :happiness_rating, :tickets)
  end  
  

end
