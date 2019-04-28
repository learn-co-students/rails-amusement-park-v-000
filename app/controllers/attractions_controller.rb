class AttractionsController < ApplicationController

  def index
    @attractions = Attraction.all
  end

  def show
    # binding.pry
    @attraction = Attraction.find_by(params[:id])
  end


  def go_on_ride
    # "hi"
    # take_ride
    # binding.pry
    ride = Ride.new
    # binding.pry
    ride.attraction_id = Attraction.find_by_id(params[:id].to_i)[:id]
    # binding.pry
    ride.user_id = session[:user_id]
    # binding.pry

    ride.take_ride
    # binding.pry
    # puts "Thanks for riding the #{ride.attraction.name}!"
    redirect_to user_path(session[:user_id])
  end


end
