class AttractionsController < ApplicationController

  def index
    # binding.pry
    @attractions = Attraction.all
  end

  def show
    @attraction = Attraction.find_by(id: params[:id])
    # @user = User.find(session[:user_id])
    session[:attraction_id] = @attraction.id
  end

  def new
    if current_user.admin == true
      @attraction = Attraction.new
      render 'new'
    else
      redirect_to user_path(current_user)
  end
end

def create
  @attraction = Attraction.create!(attraction_params)
  # @attraction.save
  redirect_to attraction_path(@attraction)
end

def edit
  if current_user.admin == true
    @attraction = Attraction.find(params[:id])
    render 'edit'
  else
    redirect_to attractions_path
end
end

def update
  @attraction = Attraction.find(params[:id])
  @attraction = Attraction.update(attraction_params)
  
  redirect_to attraction_path
end

private

def attraction_params
  params.require(:attraction).permit(:name, :tickets, :min_height, :happiness_rating, :nausea_rating)
end

end
