class AttractionsController < ApplicationController
  before_action :user_must_be_logged_in # Defined in ApplicationController

  def index
    @attractions = Attraction.all
  end

  def show
    @attraction = Attraction.find_by_id(params[:id])
  end

  def new
    # Make sure the user is logged in AND is an admin.
    if current_user.admin
      @attraction = Attraction.new
    else
      flash[:not_authorized] = "You are not authorized to view this page!"
      redirect_to user_path(current_user)
    end
  end
end
