class AttractionsController < ApplicationController
<<<<<<< HEAD
  before_action :find_attraction, only: [:edit, :update, :show]

=======
>>>>>>> refs/remotes/origin/master
  def index
    @attractions = Attraction.all
  end

<<<<<<< HEAD
=======
  def show
    @attraction = Attraction.find_by(id: params[:id])
    @ride = @attraction.rides.build(user_id:current_user.id)
  end

>>>>>>> refs/remotes/origin/master
  def new
    @attraction = Attraction.new
  end

  def create
<<<<<<< HEAD
    @attraction = Attraction.new(attraction_params)
    if @attraction.save
      redirect_to attraction_path(@attraction)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @attraction.update(attraction_params)
    redirect_to attraction_path(@attraction)
  end

  def show
    @ride = @attraction.rides.build(user_id: current_user.id)
=======
    attraction = Attraction.create(attraction_params)
    redirect_to attraction_path(attraction)
  end

  def edit
    @attraction = Attraction.find_by(id: params[:id])
    @ride = @attraction.rides.build(user_id:current_user.id)
  end

  def update
    attraction = Attraction.find_by(id: params[:id])
    attraction.update(attraction_params)
    redirect_to attraction_path(attraction)
>>>>>>> refs/remotes/origin/master
  end

  private
  def attraction_params
<<<<<<< HEAD
    params.require(:attraction).permit(:name, :min_height, :happiness_rating, :nausea_rating, :tickets)
  end

  def find_attraction
    @attraction = Attraction.find(params[:id])
  end
end
=======
    params.require(:attraction).permit(
        :name,
        :min_height,
        :tickets,
        :happiness_rating,
        :nausea_rating
      )
  end
end
>>>>>>> refs/remotes/origin/master
