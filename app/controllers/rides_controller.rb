class RidesController < ApplicationController
  def new

  end

  def create

     @attraction = Attraction.find_by(id: params[:attraction_id])
      byebug
     @attraction.rides.each do |ride|

       @user = User.find_by(id: ride.user_id)
       ride.take_ride
     end
     redirect_to user_path(@user)
  end
end
