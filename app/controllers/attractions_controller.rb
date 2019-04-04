class AttractionsController < ApplicationController
  before_action :require_admin
  skip_before_action :require_admin, only: [:index, :show]

  def new
  end

  def create

      @attraction = Attraction.create(attraction_params)
      binding.pry
      if @attraction.save
        render :show
      else
        #add a flash message here for errors
        redirect_to(controller: 'attractions', action: 'new')
      end
  end

  def show
    @attraction = Attraction.find(params[:id])
  end

  def update
    @attraction = Attraction.find_by(id: params[:id])
  end

  def index

    @attractions = Attraction.all
  end

  private

 def attraction_params
   params.require(:attraction).permit(:name, :tickets, :min_height, :happiness_rating, :nausea_rating)
 end

 def require_admin

   user = User.find_by(id: current_user)
   redirect_to "/users/home" unless user.admin
 end

end
