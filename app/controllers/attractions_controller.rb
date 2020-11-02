class AttractionsController < ApplicationController
  before_action :user_must_be_logged_in # Defined in ApplicationController
  before_action :check_for_unauthorized_user, only: [:new, :create, :edit, :update] # Defined here
  before_action :find_attraction, only: [:show, :edit, :update]

  def index
    @attractions = Attraction.all
  end

  def show
  end

  def new
    # Make sure the user is an admin.
    @attraction = Attraction.new
  end

  def create
    attraction = Attraction.create(attraction_params) 
    # Usually, I would call #new and #save separately, but the Attraction model has no validations.
    flash[:success] = "Success! Here is your new attraction, #{current_user.name}."
    redirect_to attraction_path(attraction)
  end

  def edit
  end

  def update
    @attraction.update(attraction_params)
    flash[:success] = "Successfully updated the attraction!"
    redirect_to attraction_path(@attraction)
  end

  private
  
    def attraction_params
      params.require(:attraction).permit(:name, :min_height, :happiness_rating, :nausea_rating, :tickets)
    end

    def check_for_unauthorized_user
      # Is the user an admin?
      unless current_user.admin
        flash[:not_authorized] = "You are not authorized to do this."
        redirect_to user_path(current_user)
      end
    end

    def find_attraction
      @attraction = Attraction.find_by_id(params[:id])

      if @attraction.nil?
        flash[:not_found] = "Could not find this attraction."
        redirect_to attractions_path
      end
    end
end
