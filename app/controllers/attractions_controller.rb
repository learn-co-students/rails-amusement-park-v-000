class AttractionsController < ApplicationController
  before_action :require_admin 
  skip_before_action :require_admin, only: [:index, :show]
  
  def new
  end

  def create
  end

  def show

  end

  def index
    @attractions = Attraction.all
  end

  private

 def attraction_params
   params.require(:attraction).permit(:name)
 end

 def require_admin
   redirect_to "/users/home" unless current_user.admin == true 
 end

end
