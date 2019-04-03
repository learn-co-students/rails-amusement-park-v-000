class AttractionsController < ApplicationController
  before_action :require_admin
  skip_before_action :require_admin, only: [:index, :show]

  def new
  end

  def create

      @attraction = Attraction.create(attraction_params)
      render :show

      if !@attraction.save
        #add a flash message here for errors
        redirect_to(controller: 'attractions', action: 'new')
      end
    end
  end

  def show
    @attraction = Attraction.find(params[:id])
  end

  def update

  end

  def index
    @attractions = Attraction.all
  end

  private

 def attraction_params
   params.require(:attraction).permit(:name, :tickets, :min_height, :happiness_rating, :nausea_rating)
 end

 def require_admin
   redirect_to "/users/home" unless current_user.admin == true
 end

end
