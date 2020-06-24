class RidesController < ApplicationController
    def create
     new_ride = current_user.rides.build(attraction_id: params['ride']['attraction_id'])
     result = new_ride.take_ride
     redirect_to user_path(current_user), flash: { notice: "#{result}" }
    end
  end