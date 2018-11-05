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

  def 



  end

end
