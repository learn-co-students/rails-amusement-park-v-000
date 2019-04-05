class AttractionsController < ApplicationController
  before_action :require_admin
  skip_before_action :require_admin, only: [:index, :show]

  def new
  end

  def create

      attraction = Attraction.new(attraction_params)

      if attraction.valid?
        @attraction = Attraction.create(attraction_params)
        redirect_to ("/attractions/#{@attraction.id}")
      else
        flash[:notice] = "Please complete the form with valid entries."
        redirect_to(controller: 'attractions', action: 'new')
      end
  end

  def show

    @attraction = Attraction.find(params[:id])
    @ride = Ride.new
  end

  def edit
    @attraction = Attraction.find_by(id: params[:id])
  end

  def update
    @attraction = Attraction.find_by(id: params[:id])
    @attraction.update(attraction_params)
    redirect_to attraction_path(@attraction)
  end

  def index
    @user = User.find_by(id: current_user_id)
    @attractions = Attraction.all
  end

  private

 def attraction_params
   params.require(:attraction).permit(:name, :tickets, :min_height, :happiness_rating, :nausea_rating)
 end

 def require_admin

   user = User.find_by(id: current_user_id)
   flash[:notice] = "**Only accessible by administrators.**"
   redirect_to attractions_path unless user.admin
   #add flash message and redirect to show page
 end

end
