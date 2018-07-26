class AttractionsController < ApplicationController

def index
  @user = User.find(session[:user_id])
  @attractions = Attraction.all
end

def show
  @user = User.find(session[:user_id])
  @attraction = Attraction.find(params[:id])
end

def new
  @attraction = Attraction.new
end

def create
  @attraction = Attraction.create(attraction_params(params))
  redirect_to attraction_path(@attraction)
end

  def edit
    @attraction = Attraction.find(params[:id])
  end

def update
    @attraction = Attraction.find(params[:id])
    @attraction.update(attraction_params(params))
    redirect_to attraction_path(@attraction)
end

def take_ride
  @user = User.find(session[:user_id])
  @attraction = Attraction.find(params[:attraction_id])
  @ride = Ride.new
  @ride.user = @user
  @ride.attraction = @attraction
  if @user.height >= @attraction.min_height && @user.tickets >= @attraction.tickets
    flash[:notice] = "Thanks for riding the #{@attraction.name}!"
  elsif @user.height < @attraction.min_height && @user.tickets < @attraction.tickets
    flash[:notice] = "You do not have enough tickets to ride the #{@attraction.name} and You are not tall enough to ride the #{@attraction.name}"
  elsif @user.height < @attraction.min_height
    flash[:notice] = "You are not tall enough to ride the #{@attraction.name}"
  elsif @user.tickets < @attraction.tickets
    flash[:notice] = "You do not have enough tickets to ride the #{@attraction.name}"
    end
  @ride.take_ride
  redirect_to user_path(@user)
end

private

def attraction_params(arguements)
  params.require(:attraction).permit(:name, :min_height, :nausea_rating, :happiness_rating, :tickets)
end

end
