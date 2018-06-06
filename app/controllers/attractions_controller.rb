class AttractionsController < ApplicationController
  before_action :redirect_if_not_logged_in

  def index
    @attractions = Attraction.all
  end

  def new
    @attraction = Attraction.new
    if !current_user.admin
      flash[:notice] = "Only admins can create new attractions."
      redirect_to attractions_path
    end
  end

  def create
    attraction = Attraction.new(attraction_params)
    if attraction.save
      redirect_to attraction_path(attraction)
		else
      flash[:notice] = "Something went wrong during attraction creation, please try again."
			redirect_to new_attraction_path
		end
  end

  def show
    @attraction = Attraction.find(params[:id])
  end

  # Only visible to admins (though apparently accessible by anyone through url in demo...)
  def edit
    @attraction = Attraction.find(params[:id])
    if !current_user.admin
      flash[:notice] = "Only admins can edit new attractions."
      redirect_to attraction_path(@attraction)
    end
  end

  def update
    puts "Edit Attraction Params = #{params}"
    attraction = Attraction.find(params[:id])
    attraction.update(attraction_params)
    if attraction.save
      redirect_to attraction_path(attraction)
    else
      flash[:notice] = "Something went wrong during attraction edit, please try again."
      redirect_to edit_attraction_path(attraction)
    end
  end

  private

  def attraction_params
    params.require(:attraction).permit(:name, :tickets, :nausea_rating, :happiness_rating, :min_height)
  end

end

# rspec spec/features/users_features_spec.rb --format d
# rspec spec/support/login_helper.rb --format d
